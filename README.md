# Docker 
make sure docker is engine is up and running, then:

```
docker compose up
```

will start 4 containers:
frontend 
backend 
backend-GUI
reverse proxy




# nodejs-shop

Online shop built using Node.js, Express, and MongoDB/Mongoose. The user can create an account, reset their password, add and remove cart items, upload and delete products, update data for products they added, checkout their cart, place orders, and view past orders.

It follows the MVC design pattern, and renders views on the server using the EJS templating engine. The SendGrid API is used to send emails (confirmation of account creation and password reset instructions) and payments are handled using the Stripe API. Other features include pagination, error handling, validation of user input, sessions, authentication, and file storage.

Image files are hosted in an AWS S3 bucket. Uploading a new image for a product or deleting a product entirely deletes the respective image from the bucket.

## View Locally

1. Install dependencies

```
npm install
```

2. Change the filename of `example-nodemon.json` to `nodemon.json`. Use the example as a guideline to replace keys with appropriate API keys, etc., from MongoDB, SendGrid, and Stripe. These can each be acquired using a free account.

3. Start Nodemon server at http://localhost:3000 (the `start:dev` script must be used since `nodemon.json` is used to store environment variables, and the other scripts do not use Nodemon)

```
npm run start:dev
```
