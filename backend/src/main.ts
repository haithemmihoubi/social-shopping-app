import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
async function bootstrap() {
  const app = await NestFactory.create(AppModule, {
    cors: { credentials: true, origin: 'https://social-shopping-app.vercel.app' },
  });
  const config = new DocumentBuilder()
    .setTitle(' Social shopp app api')
    .setDescription('The Social shopp app   API description')
    .setVersion('1.0')
    .addTag('social shopp app')
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('/', app, document);
  await app.listen(3000);
}
bootstrap();
