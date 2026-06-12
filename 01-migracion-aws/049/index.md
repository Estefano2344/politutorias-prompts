---
layout: default
title: '049. El paso 1 ya lo hice cuando cree los buckets, el paso 2 este es e…'
parent: Migración a AWS
nav_order: 49
permalink: /01-migracion-aws/049/
---

{% raw %}

# Prompt 049
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 3,512 caracteres &middot; **Posición en la conversación:** 49 de 64

---

```
El paso 1 ya lo hice cuando cree los buckets, el paso 2 este es el ARN: arn:aws:s3:::politutorias-storage-staging

Lo del paso 3 no estaba comentado, entonces me toca comentar y volver a pushear y el PR para contruir de nuevo y ahi se ejecutaria el seed




import { Inject, Injectable, Logger } from '@nestjs/common';

import { ConfigService } from '@nestjs/config';

import {

  S3Client,

  PutObjectCommand,

  GetObjectCommand,

  PutObjectCommandInput,

} from '@aws-sdk/client-s3';

import { getSignedUrl } from '@aws-sdk/s3-request-presigner';

import * as crypto from 'crypto';

import { Express } from 'express';




@Injectable()

export class StorageService {

  private readonly logger = new Logger(StorageService.name);




  private readonly bucketName: string;

  private readonly region: string;




  constructor(

    @Inject('S3_CLIENT') private s3Client: S3Client,

    private configService: ConfigService,

  ) {

    const bucketName = this.configService.get<string>('AWS_BUCKET_NAME');

    const region = this.configService.get<string>('AWS_REGION');




    if (!bucketName) {

      throw new Error('AWS_BUCKET_NAME is not configured');

    }

    if (!region) {

      throw new Error('AWS_REGION is not configured');

    }




    this.bucketName = bucketName;

    this.region = region;

  }




  async uploadOfferFile(file: Express.Multer.File): Promise<string> {

    return this.uploadFile(file, 'tutorias-imagenes');

  }




  async uploadProfileFile(file: Express.Multer.File): Promise<string> {

    return this.uploadFile(file, 'tutor-perfiles');

  }




  private async uploadFile(

    file: Express.Multer.File,

    folder: string,

  ): Promise<string> {

    if (!file) throw new Error('File not provided');




    const fileExtension = file.originalname.split('.').pop();

    const uniqueFileName = `${crypto.randomBytes(16).toString('hex')}.${fileExtension}`;

    const key = `${folder}/${uniqueFileName}`;




    try {

      const putObjectParams: PutObjectCommandInput = {

        Bucket: this.bucketName,

        Key: key,

        Body: file.buffer,

        ContentType: file.mimetype,

        //ACL: 'public-read', // Para que los archivos sean públicos

      };




      const command = new PutObjectCommand(putObjectParams);

      await this.s3Client.send(command);




      this.logger.log(

        `File ${uniqueFileName} uploaded to ${folder} successfully`,

      );




      // Devuelve la URL pública del archivo

      return this.getPublicUrl(key);

    } catch (error) {

      const errMsg = error instanceof Error ? error.message : String(error);

      this.logger.error(`Error uploading file: ${errMsg}`);

      throw new Error('Failed to upload file to AWS S3');

    }

  }




  private getPublicUrl(key: string): string {

    return `https://${this.bucketName}.s3.${this.region}.amazonaws.com/${key}`;

  }




  public async generatePresignedUrl(

    key: string,

    expiresIn: number = 3600,

  ): Promise<string> {

    try {

      const command = new GetObjectCommand({

        Bucket: this.bucketName,

        Key: key,

      });




      const signedUrl = await getSignedUrl(this.s3Client, command, {

        expiresIn,

      });




      return signedUrl;

    } catch (error) {

      const errMsg = error instanceof Error ? error.message : String(error);

      this.logger.error(`Error generating presigned URL: ${errMsg}`);

      throw new Error('Failed to generate presigned URL');

    }

  }

}
```

---

### Navegación

[← Prompt 048](/01-migracion-aws/048/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 050 →](/01-migracion-aws/050/)
{% endraw %}
