# EntrenaMe

**EntrenaMe** es una aplicación web diseñada como el segundo proyecto del curso de Desarrollo de Aplicaciones Web (DAW). 
Su objetivo es gestionar las actividades y servicios de un polideportivo con un enfoque especial en las necesidades de las 
personas de la tercera edad. La plataforma permite a los usuarios explorar actividades, inscribirse en ellas, reservar pistas 
deportivas y mantenerse activos, fomentando un estilo de vida saludable y adaptado a sus capacidades.


## Tabla de Contenidos

1. [Descripción del Proyecto](#entrename)
2. [Características de la Aplicación](#características-de-la-aplicación)
3. [Tecnologías Utilizadas](#tecnologías-utilizadas)
    - [Frontend](#frontend)
    - [Backend](#backend)
4. [Estructura del Proyecto](#estructura-del-proyecto)
5. [Vistas del Proyecto](#vistas-del-proyecto)
6. [Contribución](#contribución)


## Características de la Aplicación

- **Gestión de actividades**: Los usuarios pueden explorar una lista de actividades especialmente diseñadas para la tercera edad y registrarse en ellas.
- **Reserva de pistas deportivas**: Posibilidad de reservar pistas disponibles para deportes como tenis, pádel, fútbol, basquet, entre otros.
- **Sistema de autenticación**: Registro e inicio de sesión para usuarios.
- **Panel de administración**: Gestión de usuarios, actividades y reservas por parte del personal del polideportivo.
- **Interfaz adaptada**: Diseño accesible e intuitivo, pensado para facilitar la navegación a personas mayores.


## Tecnologías Utilizadas

### Frontend
- **React**: Utilizado para el panel de administración.
- **Vue 3**: Framework principal para la aplicación web completa.

### Backend
- **Laravel**: Usado para gestionar el backend del panel de administración.
- **Spring Boot**: Utilizado para el backend de la aplicación principal y un servicio adicional dedicado a la integración con Mailgun para gestionar correos.
- **Node.js**: Implementado como un servidor proxy inverso para permitir que ambos frontends (React y Vue) compartan el mismo dominio.


## Estructura del Proyecto

La arquitectura del proyecto está dividida en múltiples frontends y backends, cada uno con roles específicos:

### Frontends
1. **Panel de Administración (React)**:
   - Permite a los administradores gestionar actividades, reservas y usuarios.
   - Se comunica con el backend de Laravel para realizar las operaciones CRUD necesarias.

2. **Aplicación Principal (Vue 3)**:
   - Interfaz principal para los usuarios finales.
   - Permite explorar actividades, reservar pistas y acceder a contenido adaptado a la tercera edad.
   - Se conecta con el backend de Spring Boot para acceder a datos y realizar acciones.

### Backends
1. **Laravel**:
   - Backend para el panel de administración.
   - Gestiona la autenticación, administración de actividades, pistas y usuarios.
   - Es la API dela cual bebe REACT.

2. **Spring Boot**:
   - Backend principal de la aplicación.
   - Maneja las reservas de pistas, registro de usuarios y gestión de actividades para los usuarios finales.
   - Es la API dela cual bebe VUE.

3. **Spring Boot (Mailgun)**:
   - Servicio dedicado para gestionar el envío de correos electrónicos.
   - Integración con la API de Mailgun para notificaciones automatizadas.

4. **Node.js (Proxy Inverso)**:
   - Actúa como un servidor proxy inverso.
   - Permite que los frontends (React y Vue) compartan el mismo dominio, mejorando la experiencia del usuario y simplificando la gestión del servidor.
## Vistas del Proyecto
### 1. Home
- **Search**: Barra de búsqueda que permite a los usuarios buscar actividades por nombre.
- **Carrusel de Deportes**: Componente que muestra un carrusel con actividades categorizadas por deporte.
- **Scroll Infinito**: Sección en la parte inferior de la página que despliega actividades enfocadas a la tercera edad, con carga dinámica al desplazarse.

![Vista de la página Home]()


