import Fastify from 'fastify';

const fastify = Fastify({logger: true});

fastify.get('/hello', async (_, reply) => {
    reply.send('hello world!');
})

const port = process.env.PORT;
const host = '0.0.0.0';
fastify.listen({ port, host })