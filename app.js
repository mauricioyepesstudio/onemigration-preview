/* Onemigration — lead capture, tracking and page behaviour.
 * Edit CONFIG to connect a CRM/webhook and ad pixels. Everything works without them:
 * leads always fall back to a pre-filled WhatsApp message. */
const CONFIG = {
  whatsapp: "17869562271",
  // POST endpoint that receives JSON leads (Make/Zapier webhook, Formspree, Google Apps Script, GoHighLevel...).
  leadEndpoint: "",
  metaPixelId: "", // e.g. "123456789012345"
  ga4Id: "",       // e.g. "G-XXXXXXX"
};

// Only real, verified reviews go here (copy from Google Maps with the client's permission).
// Section stays hidden while the list is empty.
const TESTIMONIALS = [
  // { text: "…", name: "Nombre A.", case: "Residencia" },
];

const FAQ = [
  ["¿Ustedes son abogados?", "No. Onemigration no es un bufete de abogados. Te ayudamos a preparar y organizar formularios y documentos según tus instrucciones y te acompañamos durante el proceso. Si tu caso requiere asesoría legal o representación, te recomendamos un abogado de inmigración licenciado."],
  ["¿La evaluación tiene costo?", "No. La evaluación inicial es gratuita y sin compromiso. Si decides avanzar, te explicamos por escrito el costo del servicio y las tarifas de USCIS antes de empezar."],
  ["¿Atienden fuera de Florida?", "Sí. Trabajamos de forma remota con personas en todo Estados Unidos por WhatsApp, llamada o videollamada."],
  ["¿Qué necesito para empezar?", "Solo tu nombre y un WhatsApp. En la consulta te enviamos una lista personalizada de documentos según tu trámite."],
  ["¿Cuánto tarda mi trámite?", "Depende del tipo de caso y de los tiempos de procesamiento de USCIS, que cambian con frecuencia. En la consulta revisamos los tiempos vigentes para tu caso y oficina."],
  ["¿Mi información es confidencial?", "Sí. Tu información solo se usa para atender tu caso y nunca se comparte con terceros sin tu autorización."],
];

/* ---------- tracking ---------- */
function loadPixels() {
  if (CONFIG.metaPixelId) {
    !function (f, b, e, v, n, t, s) { if (f.fbq) return; n = f.fbq = function () { n.callMethod ? n.callMethod.apply(n, arguments) : n.queue.push(arguments) }; if (!f._fbq) f._fbq = n; n.push = n; n.loaded = !0; n.version = "2.0"; n.queue = []; t = b.createElement(e); t.async = !0; t.src = v; s = b.getElementsByTagName(e)[0]; s.parentNode.insertBefore(t, s) }(window, document, "script", "https://connect.facebook.net/en_US/fbevents.js");
    fbq("init", CONFIG.metaPixelId); fbq("track", "PageView");
  }
  if (CONFIG.ga4Id) {
    const s = document.createElement("script");
    s.async = true; s.src = "https://www.googletagmanager.com/gtag/js?id=" + CONFIG.ga4Id;
    document.head.appendChild(s);
    window.dataLayer = window.dataLayer || [];
    window.gtag = function () { dataLayer.push(arguments); };
    gtag("js", new Date()); gtag("config", CONFIG.ga4Id);
  }
}

function track(event, params = {}) {
  if (window.gtag) gtag("event", event, params);
  if (window.fbq) {
    const std = { lead: "Lead", contact: "Contact", subscribe: "CompleteRegistration" }[params.kind];
    std ? fbq("track", std, params) : fbq("trackCustom", event, params);
  }
}

/* ---------- attribution (utm_* from IG/TikTok/ads links) ---------- */
const attribution = (() => {
  const keys = ["utm_source", "utm_medium", "utm_campaign", "utm_content"];
  const q = new URLSearchParams(location.search);
  let saved = {};
  try { saved = JSON.parse(sessionStorage.getItem("om_attr") || "{}"); } catch (_) {}
  keys.forEach((k) => { if (q.get(k)) saved[k] = q.get(k); });
  if (!saved.referrer && document.referrer) saved.referrer = document.referrer;
  try { sessionStorage.setItem("om_attr", JSON.stringify(saved)); } catch (_) {}
  return saved;
})();

async function sendLead(payload) {
  const lead = { ...payload, ...attribution, page: location.href, ts: new Date().toISOString() };
  if (!CONFIG.leadEndpoint) return;
  try {
    await fetch(CONFIG.leadEndpoint, { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify(lead), keepalive: true });
  } catch (_) { /* WhatsApp fallback still delivers the lead */ }
}

const waLink = (msg) => `https://wa.me/${CONFIG.whatsapp}?text=${encodeURIComponent(msg)}`;

/* ---------- WhatsApp buttons ---------- */
document.querySelectorAll(".js-wa").forEach((a) => {
  a.href = waLink(a.dataset.msg || "Hola Laura");
  a.target = "_blank"; a.rel = "noopener";
  a.addEventListener("click", () => track("whatsapp_click", { kind: "contact", placement: a.dataset.track }));
});

document.querySelectorAll("[data-track]:not(.js-wa)").forEach((el) =>
  el.addEventListener("click", () => track("cta_click", { placement: el.dataset.track })));

/* ---------- quiz ---------- */
const quiz = document.getElementById("quiz");
const steps = [...quiz.querySelectorAll(".qstep")];
const bar = document.getElementById("quizBar");
const back = document.getElementById("quizBack");
const answers = {};
let current = 1;

function go(n) {
  current = n;
  steps.forEach((s) => s.classList.toggle("is-active", +s.dataset.step === n));
  bar.style.width = Math.min(n, 4) * 25 + "%";
  back.hidden = n === 1 || n === 5;
  if (n === 2) track("quiz_start", { servicio: answers.servicio });
}

quiz.querySelectorAll(".opts").forEach((group) => {
  group.addEventListener("click", (e) => {
    const btn = e.target.closest("button");
    if (!btn) return;
    group.querySelectorAll("button").forEach((b) => b.classList.remove("is-picked"));
    btn.classList.add("is-picked");
    answers[group.dataset.name] = btn.textContent.trim();
    setTimeout(() => go(current + 1), 180);
  });
});
back.addEventListener("click", () => go(Math.max(1, current - 1)));

// Service cards jump into the quiz with the service pre-selected.
document.querySelectorAll(".svc").forEach((card) => card.addEventListener("click", () => {
  const svc = card.dataset.svc;
  const btn = [...quiz.querySelectorAll('[data-name="servicio"] button')].find((b) => b.textContent.trim() === svc);
  if (btn) btn.click();
  track("service_click", { servicio: svc });
  document.getElementById("evaluacion").scrollIntoView();
}));

function priority({ etapa, urgencia }) {
  if (/corte|negación|RFE/i.test(etapa || "") || urgencia === "Esta semana") return "ALTA";
  if (urgencia === "Este mes") return "MEDIA";
  return "BAJA";
}

quiz.addEventListener("submit", async (e) => {
  e.preventDefault();
  const f = new FormData(quiz);
  const nombre = (f.get("nombre") || "").trim();
  const telefono = (f.get("telefono") || "").replace(/[^\d+]/g, "");
  const err = document.getElementById("quizErr");
  if (nombre.length < 2) return (err.textContent = "Escribe tu nombre.");
  if (telefono.replace(/\D/g, "").length < 10) return (err.textContent = "Escribe un número de WhatsApp válido (10 dígitos).");
  if (!f.get("consent")) return (err.textContent = "Necesitamos tu autorización para contactarte.");
  err.textContent = "";

  const lead = { ...answers, nombre, telefono, email: f.get("email") || "", estado: f.get("estado") || "", prioridad: priority(answers), source: "quiz" };
  await sendLead(lead);
  track("generate_lead", { kind: "lead", servicio: lead.servicio, prioridad: lead.prioridad });

  const msg = `Hola Laura, soy ${nombre}. Acabo de hacer la evaluación en su web.\n• Trámite: ${lead.servicio || "-"}\n• Etapa: ${lead.etapa || "-"}\n• Urgencia: ${lead.urgencia || "-"}\n• Estado: ${lead.estado || "-"}\n¿Me puede orientar?`;
  document.getElementById("doneName").textContent = nombre.split(" ")[0];
  document.getElementById("doneWa").href = waLink(msg);
  go(5);
});

/* ---------- lead magnets / newsletter ---------- */
document.querySelectorAll(".js-magnet").forEach((form) => form.addEventListener("submit", async (e) => {
  e.preventDefault();
  const email = form.email.value.trim();
  if (!/^\S+@\S+\.\S+$/.test(email)) return form.email.focus();
  await sendLead({ email, source: form.dataset.source });
  track("subscribe", { kind: "subscribe", source: form.dataset.source });
  if (form.dataset.redirect) return (location.href = form.dataset.redirect);
  form.hidden = true;
  const ok = form.parentElement.querySelector(".ok");
  if (ok) ok.hidden = false;
}));

/* ---------- testimonials ---------- */
if (TESTIMONIALS.length) {
  const box = document.getElementById("quotes");
  TESTIMONIALS.forEach((t) => {
    const fig = document.createElement("figure");
    fig.className = "quote";
    const p = document.createElement("p"); p.textContent = `“${t.text}”`;
    const c = document.createElement("cite"); c.textContent = `${t.name} · ${t.case}`;
    fig.append(p, c); box.appendChild(fig);
  });
  document.getElementById("testimonios").hidden = false;
}

/* ---------- FAQ + FAQPage schema (SEO) ---------- */
const faqList = document.getElementById("faqList");
FAQ.forEach(([q, a]) => {
  const d = document.createElement("details");
  const s = document.createElement("summary"); s.textContent = q;
  const p = document.createElement("p"); p.textContent = a;
  d.append(s, p); faqList.appendChild(d);
});
const ld = document.createElement("script");
ld.type = "application/ld+json";
ld.textContent = JSON.stringify({ "@context": "https://schema.org", "@type": "FAQPage",
  mainEntity: FAQ.map(([q, a]) => ({ "@type": "Question", name: q, acceptedAnswer: { "@type": "Answer", text: a } })) });
document.head.appendChild(ld);

/* ---------- lite YouTube embed ---------- */
document.querySelectorAll(".yt").forEach((el) => el.querySelector("button").addEventListener("click", () => {
  el.innerHTML = `<iframe src="https://www.youtube-nocookie.com/embed/${el.dataset.id}?autoplay=1" title="Onemigration en YouTube" allow="autoplay; encrypted-media" allowfullscreen></iframe>`;
  track("video_play", { id: el.dataset.id });
}));

document.getElementById("yr").textContent = new Date().getFullYear();
loadPixels();
