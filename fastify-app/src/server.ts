import Fastify from 'fastify'

const app = Fastify({ logger: true })

app.post('/', async (request, reply) => {
  for (const [name, value] of Object.entries(request.headers)) console.log(`${name}: ${value}`);
  return reply.send();
})

await app.listen({ port: Number(process.env.PORT) || 3000, host: '0.0.0.0' })
