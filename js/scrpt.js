// script.js
console.log("Alerta Mental - script.js cargado correctamente.");

// Ejemplo: Si quisieras validar el formulario de contacto
const contactForm = document.querySelector('.contact-form');
if(contactForm){
  contactForm.addEventListener('submit', (e) => {
    e.preventDefault();
    alert('¡Gracias por tu mensaje! Nos pondremos en contacto contigo pronto.');
    contactForm.reset();
  });
}
