/* Explicit receipt contract. A successful HTTP response alone is not a saved lead. */
(function (root) {
  async function sendLead(endpoint, lead, options = {}) {
    if (!endpoint) return { delivered: false, reason: "not-configured" };
    const controller = new AbortController();
    const timer = setTimeout(() => controller.abort(), options.timeoutMs ?? 8000);
    try {
      const response = await (options.fetchImpl || root.fetch)(endpoint, {
        method: "POST", headers: { "Content-Type": "application/json" },
        body: JSON.stringify(lead), signal: controller.signal,
      });
      if (!response.ok) return { delivered: false, reason: "http-error" };
      const receipt = await response.json();
      return receipt?.accepted === true
        ? { delivered: true, reason: "accepted" }
        : { delivered: false, reason: "unconfirmed" };
    } catch (_) {
      return { delivered: false, reason: controller.signal.aborted ? "timeout" : "network-error" };
    } finally { clearTimeout(timer); }
  }
  function receiptMessage(result) {
    return result.delivered
      ? "Tu solicitud de contacto fue recibida. También puedes escribirle a Laura por WhatsApp."
      : "Tu mensaje está preparado, pero todavía no fue enviado. Pulsa Enviar por WhatsApp y confirma el envío allí para contactar a Laura.";
  }
  const api = { sendLead, receiptMessage };
  if (typeof module !== "undefined" && module.exports) module.exports = api;
  else root.OnemigrationDelivery = api;
})(globalThis);
