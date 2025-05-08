// quiz.js
document.addEventListener('DOMContentLoaded', () => {
  const quizForm = document.getElementById('quizForm');
  const quizResult = document.getElementById('quizResult');

  if (quizForm) {
    quizForm.addEventListener('submit', (e) => {
      e.preventDefault();

      let score = 0;
      for (let i = 1; i <= 10; i++) {
        const answer = quizForm[`q${i}`].value;
        score += parseInt(answer);
      }

      let message = "";
      let directoryHTML = "";

      if (score <= 5) {
        message = "Parece que tu estado emocional es estable. ¡Sigue cuidándote!";
      } else if (score <= 12) {
        message = "Podrías estar experimentando algo de estrés o ansiedad. Revisa nuestros recursos y considera hablar con alguien de confianza.";
        directoryHTML = generarDirectorio();
      } else {
        message = "Tus respuestas indican un posible nivel alto de estrés o ansiedad. Te recomendamos buscar apoyo profesional.";
        directoryHTML = generarDirectorio();
      }

      quizResult.innerHTML = `
        <h3>Resultado de tu Evaluación</h3>
        <p>${message}</p>
        ${directoryHTML}
      `;
    });
  }

  function generarDirectorio() {
  return `
    <div class="directorio">
      <style>
        .directorio {
          background-color: #f8f9fa;
          border-radius: 10px;
          padding: 20px;
          box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
          margin-top: 20px;
          border-left: 5px solid #00838f;
        }

        .directorio h4 {
          color: #00838f;
          margin-bottom: 15px;
          font-size: 1.2rem;
          padding-bottom: 10px;
          border-bottom: 1px solid #e1e4e8;
        }

        .directorio ul {
          list-style-type: none;
          padding-left: 0;
        }

        .directorio li {
          padding: 10px 0;
          border-bottom: 1px solid #ebedef;
          transition: background-color 0.2s ease;
        }

        .directorio li:last-child {
          border-bottom: none;
        }

        .directorio li:hover {
          background-color: #f1f3f4;
          padding-left: 5px;
        }

        .directorio strong {
          color: #006064;
          display: block;
          margin-bottom: 3px;
        }

        .directorio .fecha-actualizacion {
          font-size: 0.8rem;
          color: #777;
          font-style: italic;
          text-align: right;
          margin-top: 15px;
          border-top: 1px dashed #e1e4e8;
          padding-top: 10px;
        }

        @media (max-width: 768px) {
          .directorio {
            padding: 15px;
          }

          .directorio h4 {
            font-size: 1.1rem;
          }
        }
      </style>
      <h4>Directorio de Apoyo en Salud Mental – Guadalajara, Jalisco</h4>
      <ul>
        <li><strong>Línea de la Vida (atención emocional 24/7):</strong> 800 911 2000</li>
        <li><strong>Centro de Atención Psicológica CUCS (UdeG):</strong> Sierra Mojada 950, Col. Independencia. Tel: 33 1058 5200 ext. 33756</li>
        <li><strong>Hospital Civil Fray Antonio Alcalde (Psiquiatría):</strong> Hospital 278, Col. El Retiro. Tel: 33 3942 4400</li>
        <li><strong>Instituto Jalisciense de Salud Mental (SALME):</strong> Av. Zoquipan 1000-A, Col. Seattle. Tel: 33 3030 9900</li>
      </ul>
      <div class="fecha-actualizacion">Información actualizada: mayo 2025</div>
    </div>
  `;
 }
});
