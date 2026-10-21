const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const { sendLead, receiptMessage } = require('../lead-delivery.js');

test('unconfigured receiver never confirms delivery or makes a request', async () => {
  const result = await sendLead('', {}, { fetchImpl: () => { throw Error('must not call'); } });
  assert.equal(result.delivered, false);
  assert.match(receiptMessage(result), /todavía no fue enviado/);
});
for (const [name, response] of [
  ['HTTP500', { ok: false }],
  ['HTTP200 without receipt', { ok: true, json: async () => ({}) }],
  ['string boolean', { ok: true, json: async () => ({ accepted: 'true' }) }],
  ['malformed receipt', { ok: true, json: async () => { throw Error('badJSON'); } }],
]) test(name + ' cannot produce received state', async () => {
  assert.equal((await sendLead('/api/contact', {}, { fetchImpl: async () => response })).delivered, false);
});
test('network failure stays pending', async () => {
  assert.equal((await sendLead('/api/contact', {}, { fetchImpl: async () => { throw Error('offline'); } })).delivered, false);
});
test('bounded timeout aborts request and permits retry', async () => {
  const result = await sendLead('/api/contact', {}, { timeoutMs: 5, fetchImpl: (_, {signal}) => new Promise((_, reject) => signal.addEventListener('abort', () => reject(Error('abort')))) });
  assert.deepEqual(result, { delivered: false, reason: 'timeout' });
});
test('only explicit acceptance confirms delivery; payload is JSON', async () => {
  let body;
  const result = await sendLead('/api/contact', { nombre: 'Demo' }, { fetchImpl: async (_, options) => {
    body = JSON.parse(options.body); return { ok: true, json: async () => ({ accepted: true }) };
  } });
  assert.deepEqual(body, { nombre: 'Demo' });
  assert.equal(result.delivered, true);
  assert.match(receiptMessage(result), /fue recibida/);
});
test('separate attributed routes never include personal information', () => {
  const html = fs.readFileSync('index.html', 'utf8');
  const links = [...html.matchAll(/href="(https:\/\/evolusa\.vercel\.app[^\"]*)"/g)].map(m => new URL(m[1]));
  assert.ok(links.some(u => u.pathname === '/aplicar-profesional'));
  assert.ok(links.some(u => u.pathname === '/'));
  for (const u of links) assert.deepEqual([...u.searchParams], [['ref', '1migration']]);
  assert.doesNotMatch(html, /Recibimos tu evaluación|js-magnet|Te avisaremos de cada cambio/);
  assert.ok(html.indexOf('src="lead-delivery.js"') < html.indexOf('src="app.js"'));
});
