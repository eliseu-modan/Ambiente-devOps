 #!/bin/sh

# Definir as permissões de execução para o Prisma
chmod +x node_modules/.bin/prisma


# Executar as migrações do Prisma
npx prisma generate
npx prisma migrate dev

# Iniciar o servidor Node.js
npm run dev:server
