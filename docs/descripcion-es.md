# Descripción del proyecto — KidPlanner

## Resumen

**KidPlanner** es un asistente de inteligencia artificial para padres que funciona dentro de Telegram.

El bot ayuda con preguntas cotidianas sobre rutinas, sueño, actividades, aprendizaje y organización familiar. La solución utiliza n8n para coordinar los flujos, PostgreSQL para guardar usuarios e historial, y una API de IA para generar respuestas.

## Funciones principales

- respuestas de IA para preguntas de padres;
- memoria de conversaciones en PostgreSQL;
- límites de solicitudes por usuario o tarifa;
- consejos diarios automáticos;
- integración con pagos mediante webhooks;
- automatización completa en n8n;
- configuración de demostración sin secretos reales.

## Flujo principal

```text
Padre en Telegram
        ↓
Bot de Telegram
        ↓
Trigger de Telegram en n8n
        ↓
Comprobación de usuario y límite
        ↓
Solicitud a la API de IA
        ↓
Guardado del historial
        ↓
Respuesta en Telegram
```

## Tecnologías

- Telegram Bot API
- n8n
- PostgreSQL
- OpenAI API
- webhooks de pago

## Valor del proyecto

KidPlanner puede utilizarse como:

- bot por suscripción;
- asistente para comunidades de padres;
- herramienta para especialistas en crianza;
- plantilla white-label;
- ejemplo de producto de IA con automatización y base de datos.

## Seguridad

El repositorio no debe contener:

- tokens reales;
- claves API;
- identificadores reales de usuarios;
- mensajes privados;
- datos de pago;
- credenciales de PostgreSQL;
- URLs de webhooks de producción.
