# UniCore Research Questions

## 1️⃣ GET vs POST

The GET and POST methods are used in HTML forms to send data to the server.

GET:

- Sends data through the URL.
- Data appears in the browser address bar.
- It is less secure because sensitive information can be seen in the URL.
- It is mainly used for retrieving data.

Example:
example.com/register?name=ahmed&email=test@gmail.com

POST:

- Sends data inside the HTTP request body.
- Data does not appear in the URL.
- It is more secure than GET for sending sensitive data.
- It is used for submitting forms or creating new records.

For the register.html page, we should use POST because the form contains sensitive information such as password and personal data.

---

## 2️⃣ Semantic HTML

Semantic HTML means using tags that describe the meaning of the content.

Examples:

<header>
<main>
<section>
<footer>

Benefits:

- Improves website accessibility for screen readers.
- Makes the code easier to read and understand.
- Helps search engines (SEO) understand the page structure.
- Makes the website easier to maintain.

Using only <div> tags works, but semantic tags give meaning to the structure of the webpage.

---

## 3️⃣ The Request / Response Cycle

When you type google.com and press Enter, the browser performs these steps:

1. The browser checks the DNS (Domain Name System) to find the IP address of google.com.
2. DNS returns the IP address of Google's server.
3. The browser sends an HTTP request to that IP address.
4. The server processes the request.
5. The server sends back an HTTP response containing the webpage files (HTML, CSS, JavaScript).
6. The browser renders the page and displays it to the user.
