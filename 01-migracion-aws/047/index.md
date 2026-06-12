---
layout: default
title: '047. <img alt=''Portada de la tutoría'' loading=''lazy'' decoding=''async''…'
parent: Migración a AWS
nav_order: 47
permalink: /01-migracion-aws/047/
---

{% raw %}

# Prompt 047
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 49,286 caracteres &middot; **Posición en la conversación:** 47 de 64

---

```
<img alt="Portada de la tutoría" loading="lazy" decoding="async" data-nimg="fill" class="object-cover" style="position:absolute;height:100%;width:100%;left:0;top:0;right:0;bottom:0;color:transparent" src="https://example.com/error-placeholder.jpg">




esto me sale en ese elemento, ademas asi esta mi seed:

import { Career } from '../../catalogs/interfaces/faculty.interface';




interface SeedTutor {

  dni: string;

  name: string;

  lastName: string;

  faculty: string;

  image: string;

  primaryPhone?: string;

  carrersFaculty: Career[];

  offers?: SeedOffer[];

}




interface SeedStudent {

  dni: string;

  name: string;

  lastName: string;

  faculty: string;

  image: string;

  carrersFaculty: string;

}




interface SeedOffer {

  career: string;

  subject: string;

  mode: string;

  price: number;

  description: string;

  indications: string;

  image: string;

}




interface SeedData {

  tutors: SeedTutor[];

  students: SeedStudent[];

}




export const initialData: SeedData = {

  tutors: [

    {

      dni: '1234567890',

      name: 'Henry',

      lastName: 'Carrasco',

      faculty: 'Facultad de Ingeniería en Sistemas',

      image: 'henry-carrasco-profile.jpg',

      primaryPhone: '0987654321',

      carrersFaculty: [

        {

          careerId: '1',

          careerName: 'Ingeniería de Software',

          subjects: [

            { subjectCode: 'MATD113', subjectName: 'Álgebra Lineal' },

            { subjectCode: 'MATD123', subjectName: 'Cálculo en una Variable' },

            { subjectCode: 'FISD134', subjectName: 'Mecánica Newtoniana' },

            { subjectCode: 'ICCD144', subjectName: 'Programación I' },

            {

              subjectCode: 'CSHD111',

              subjectName: 'Comunicación Oral y Escrita',

            },

            {

              subjectCode: 'MATD213',

              subjectName: 'Ecuaciones Diferenciales Ordinarias',

            },

            {

              subjectCode: 'ICCD224',

              subjectName:

                'Matemáticas Computacionales y Teoría de la Computación',

            },

            {

              subjectCode: 'ICCD233',

              subjectName: 'Fundamentos de Electrónica para Computación',

            },

            { subjectCode: 'ICCD244', subjectName: 'Programación II' },

            {

              subjectCode: 'CSHD211',

              subjectName: 'Análisis Socioeconómico y Político del Ecuador',

            },

            {

              subjectCode: 'MATD223',

              subjectName: 'Probabilidad y Estadísticas Básicas',

            },

            { subjectCode: 'ICCD323', subjectName: 'Sistemas Operativos' },

            {

              subjectCode: 'ICCD332',

              subjectName: 'Arquitectura de Computadores',

            },

            {

              subjectCode: 'ICCD343',

              subjectName: 'Estructura de Datos y Algoritmos I',

            },

            {

              subjectCode: 'ICCD353',

              subjectName: 'Fundamentos de Redes y Conectividad',

            },

            {

              subjectCode: 'CSHD300',

              subjectName: 'Asignatura de Artes y Humanidades',

            },

            { subjectCode: 'ICCD412', subjectName: 'Métodos Numéricos' },

            { subjectCode: 'ICCD422', subjectName: 'Compiladores y Lenguajes' },

            {

              subjectCode: 'ICCD432',

              subjectName: 'Multiprocesamiento y Arquitecturas Alternativas',

            },

            {

              subjectCode: 'ICCD442',

              subjectName: 'Estructura de Datos y Algoritmos II',

            },

            {

              subjectCode: 'ICCD453',

              subjectName: 'Fundamentos de Bases de Datos',

            },

            { subjectCode: 'ICCD463', subjectName: 'Redes de Computadoras I' },

            {

              subjectCode: 'CDHD400',

              subjectName: 'Asignatura de Economía y Sociedad',

            },

            { subjectCode: 'ICCD512', subjectName: 'Ingeniería de Software I' },

            { subjectCode: 'ICCD523', subjectName: 'Inteligencia Artificial' },

            { subjectCode: 'ICCD533', subjectName: 'Computación Gráfica' },

            { subjectCode: 'ADMD511', subjectName: 'Gestión Organizacional' },

            {

              subjectCode: 'ISWD553',

              subjectName: 'Bases de Datos Distribuidas',

            },

            { subjectCode: 'ICCD563', subjectName: 'Redes de Computadoras II' },

            { subjectCode: 'ISWD613', subjectName: 'Aplicaciones Web' },

            {

              subjectCode: 'ICCD623',

              subjectName: 'Data Mining y Machine Learning',

            },

            {

              subjectCode: 'ICCD632',

              subjectName: 'Ingeniería de Software II',

            },

            { subjectCode: 'ISWD643', subjectName: 'Tecnologías de Seguridad' },

            { subjectCode: 'ICCD654', subjectName: 'Computación Distribuida' },

            { subjectCode: 'ISWD713', subjectName: 'Aplicaciones Móviles' },

            {

              subjectCode: 'ISWD723',

              subjectName: 'Interacción Humano-Computador',

            },

            { subjectCode: 'ICCD733', subjectName: 'Seguridad Informática' },

            { subjectCode: 'ISWD743', subjectName: 'Business Intelligence' },

            {

              subjectCode: 'ICCD753',

              subjectName: 'Recuperación de la Información',

            },

            { subjectCode: 'ICCD814', subjectName: 'Modelos y Simulación' },

            { subjectCode: 'ICCD823', subjectName: 'Cloud Computing' },

            { subjectCode: 'ICCD833', subjectName: 'Auditoría Informática' },

            {

              subjectCode: 'ICCD842',

              subjectName: 'Profesionalismo en Informática',

            },

            { subjectCode: 'ADMD711', subjectName: 'Ingeniería Financiera' },

            {

              subjectCode: 'ADMD611',

              subjectName: 'Gestión de Procesos y Calidad',

            },

            {

              subjectCode: 'TITD104',

              subjectName:

                'Diseño de Trabajo de Integración Curricular / Preparación Examen Complexivo',

            },

            {

              subjectCode: 'TITD201',

              subjectName:

                'Trabajo de Integración Curricular / Examen Complexivo',

            },

            { subjectCode: 'PRLD105', subjectName: 'Prácticas Laborales' },

            {

              subjectCode: 'PSCD202',

              subjectName: 'Prácticas de Servicio Comunitario',

            },

            {

              subjectCode: 'ISWD922',

              subjectName:

                'Gestión de Tecnologías de la Información y Comunicación',

            },

          ],

        },

        {

          careerId: '2',

          careerName: 'Computación',

          subjects: [

            { subjectCode: 'MATD113', subjectName: 'Álgebra Lineal' },

            { subjectCode: 'MATD123', subjectName: 'Cálculo en una Variable' },

            { subjectCode: 'FISD134', subjectName: 'Mecánica Newtoniana' },

            { subjectCode: 'ICCD144', subjectName: 'Programación I' },

            {

              subjectCode: 'CSHD111',

              subjectName: 'Comunicación Oral y Escrita',

            },

            {

              subjectCode: 'MATD213',

              subjectName: 'Ecuaciones Diferenciales Ordinarias',

            },

            {

              subjectCode: 'ICCD224',

              subjectName:

                'Matemáticas Computacionales y Teoría de la Computación',

            },

            {

              subjectCode: 'ICCD233',

              subjectName: 'Fundamentos de Electrónica para Computación',

            },

            { subjectCode: 'ICCD244', subjectName: 'Programación II' },

            {

              subjectCode: 'CSHD211',

              subjectName: 'Análisis Socioeconómico y Político del Ecuador',

            },

            {

              subjectCode: 'MATD223',

              subjectName: 'Probabilidad y Estadísticas Básicas',

            },

            { subjectCode: 'ICCD323', subjectName: 'Sistemas Operativos' },

            {

              subjectCode: 'ICCD332',

              subjectName: 'Arquitectura de Computadores',

            },

            {

              subjectCode: 'ICCD343',

              subjectName: 'Estructura de Datos y Algoritmos I',

            },

            {

              subjectCode: 'ICCD353',

              subjectName: 'Fundamentos de Redes y Conectividad',

            },

            {

              subjectCode: 'CSHD300',

              subjectName: 'Asignatura de Artes y Humanidades',

            },

            { subjectCode: 'ICCD412', subjectName: 'Métodos Numéricos' },

            { subjectCode: 'ICCD422', subjectName: 'Compiladores y Lenguajes' },

            {

              subjectCode: 'ICCD432',

              subjectName: 'Multiprocesamiento y Arquitecturas Alternativas',

            },

            {

              subjectCode: 'ICCD442',

              subjectName: 'Estructura de Datos y Algoritmos II',

            },

            {

              subjectCode: 'ICCD453',

              subjectName: 'Fundamentos de Bases de Datos',

            },

            { subjectCode: 'ICCD463', subjectName: 'Redes de Computadoras I' },

            {

              subjectCode: 'CDHD400',

              subjectName: 'Asignatura de Economía y Sociedad',

            },

            { subjectCode: 'ICCD512', subjectName: 'Ingeniería de Software I' },

            { subjectCode: 'ICCD523', subjectName: 'Inteligencia Artificial' },

            { subjectCode: 'ICCD533', subjectName: 'Computación Gráfica' },

            { subjectCode: 'ADMD511', subjectName: 'Gestión Organizacional' },

            {

              subjectCode: 'ISWD553',

              subjectName: 'Bases de Datos Distribuidas',

            },

            { subjectCode: 'ICCD563', subjectName: 'Redes de Computadoras II' },

            { subjectCode: 'ISWD613', subjectName: 'Aplicaciones Web' },

            {

              subjectCode: 'ICCD623',

              subjectName: 'Data Mining y Machine Learning',

            },

            {

              subjectCode: 'ICCD632',

              subjectName: 'Ingeniería de Software II',

            },

            { subjectCode: 'ISWD643', subjectName: 'Tecnologías de Seguridad' },

            { subjectCode: 'ICCD654', subjectName: 'Computación Distribuida' },

            { subjectCode: 'ISWD713', subjectName: 'Aplicaciones Móviles' },

            {

              subjectCode: 'ISWD723',

              subjectName: 'Interacción Humano-Computador',

            },

            { subjectCode: 'ICCD733', subjectName: 'Seguridad Informática' },

            { subjectCode: 'ISWD743', subjectName: 'Business Intelligence' },

            {

              subjectCode: 'ICCD753',

              subjectName: 'Recuperación de la Información',

            },

            { subjectCode: 'ICCD814', subjectName: 'Modelos y Simulación' },

            { subjectCode: 'ICCD823', subjectName: 'Cloud Computing' },

            { subjectCode: 'ICCD833', subjectName: 'Auditoría Informática' },

            {

              subjectCode: 'ICCD842',

              subjectName: 'Profesionalismo en Informática',

            },

            { subjectCode: 'ADMD711', subjectName: 'Ingeniería Financiera' },

            {

              subjectCode: 'ADMD611',

              subjectName: 'Gestión de Procesos y Calidad',

            },

            {

              subjectCode: 'TITD104',

              subjectName:

                'Diseño de Trabajo de Integración Curricular / Preparación Examen Complexivo',

            },

            {

              subjectCode: 'TITD201',

              subjectName:

                'Trabajo de Integración Curricular / Examen Complexivo',

            },

            { subjectCode: 'PRLD105', subjectName: 'Prácticas Laborales' },

            {

              subjectCode: 'PSCD202',

              subjectName: 'Prácticas de Servicio Comunitario',

            },

            {

              subjectCode: 'ISWD922',

              subjectName:

                'Gestión de Tecnologías de la Información y Comunicación',

            },

          ],

        },

      ],




      offers: [

        {

          career: 'Ingeniería de Software',

          subject: 'Programación I',

          mode: 'Virtual',

          price: 50,

          description:

            'Clases de refuerzo de Programación I, enfocadas en lógica y estructuras de control.',

          indications:

            'Se requiere tener instalado el software de desarrollo antes de la clase.',

          image: 'tutoria-programacion.jpg',

        },

      ],

    },

  ],

  students: [

    {

      dni: '1234567890',

      name: 'Patricio',

      lastName: 'Chancusig',

      faculty: 'Facultad de Ingeniería en Sistemas',

      image: 'pattricio-chancusig-profile.jpg',

      carrersFaculty: 'Ingeniería de Software',

    },

  ],

};







import { NestFactory } from '@nestjs/core';

import { AppModule } from '../app.module';

import { SeedService } from './seed.service';




async function bootstrap() {

  const app = await NestFactory.createApplicationContext(AppModule);




  const seedService = app.get(SeedService);




  try {

    await seedService.executeSeed();

  } catch (error) {

    console.error('Error durante el proceso de Seed:', error);

    process.exit(1);

  } finally {

    await app.close();

    process.exit(0);

  }

}




void bootstrap();




// src/seed/seed.controller.ts

import {

  Controller,

  Post,

  Headers,

  UnauthorizedException,

} from '@nestjs/common';

import { SeedService } from './seed.service';

import { ConfigService } from '@nestjs/config';




@Controller('admin')

export class SeedController {

  constructor(

    private readonly seedService: SeedService,

    private readonly configService: ConfigService,

  ) {}




  @Post('seed')

  async runSeed(@Headers('x-api-key') apiKey: string) {

    const validKey = this.configService.get<string>('SEED_API_KEY');

    if (apiKey !== validKey) {

      throw new UnauthorizedException('Clave API no válida');

    }




    await this.seedService.executeSeed();

    return { message: 'Seed ejecutado correctamente' };

  }

}







import { Module } from '@nestjs/common';

import { TypeOrmModule } from '@nestjs/typeorm';

import { ConfigModule } from '@nestjs/config';

import { SeedService } from './seed.service';




import { Ofert } from '../oferts/entities/ofert.entity';

import { StorageModule } from '../storage/storage.module';

import { Faculty } from '../catalogs/entities/faculty.entity';

import { Career } from '../catalogs/entities/career.entity';

import { Subject } from '../catalogs/entities/subject.entity';

import { User } from '../auth/entities/user.entity';

import { Schedule } from '../schedule/entities/schedule.entity';

import { Day } from '../schedule/entities/day.entity';

import { Slot } from '../schedule/entities/slot.entity';

import { Request } from '../request/entities/request.entity';

import { Review } from '../request/entities/review.entity';

import { SeedController } from './seed.controller';




@Module({

  controllers: [SeedController],

  providers: [SeedService],

  imports: [

    ConfigModule,

    StorageModule,

    TypeOrmModule.forFeature([

      Ofert,

      Faculty,

      Career,

      Subject,

      User,

      Schedule,

      Day,

      Slot,

      Request,

      Review,

    ]),

  ],

  exports: [SeedService],

})

export class SeedModule {}







/* eslint-disable @typescript-eslint/no-unsafe-call */

/* eslint-disable @typescript-eslint/no-unsafe-assignment */




import { Injectable, Logger } from '@nestjs/common';

import { InjectRepository } from '@nestjs/typeorm';

import { Repository, DataSource } from 'typeorm';

import { Ofert } from '../oferts/entities/ofert.entity';

import { initialData } from './data/ofertas.data';

import { StorageService } from '../storage/storage.service';

import * as fs from 'fs';

import * as path from 'path';

import { Readable } from 'stream';

import { Faculty } from '../catalogs/entities/faculty.entity';

import { Career } from '../catalogs/entities/career.entity';

import { Subject } from '../catalogs/entities/subject.entity';

import { User } from '../auth/entities/user.entity';

import { Schedule } from '../schedule/entities/schedule.entity';

import { Day } from '../schedule/entities/day.entity';

import { Slot } from '../schedule/entities/slot.entity';

import { Request } from '../request/entities/request.entity';

import { Review } from '../request/entities/review.entity';

import * as bcrypt from 'bcrypt';

import { v4 as uuidv4 } from 'uuid';




@Injectable()

export class SeedService {

  private readonly logger = new Logger(SeedService.name);




  constructor(

    @InjectRepository(User)

    private readonly userRepository: Repository<User>,

    @InjectRepository(Ofert)

    private readonly ofertRepository: Repository<Ofert>,

    @InjectRepository(Schedule)

    private readonly scheduleRepository: Repository<Schedule>,

    @InjectRepository(Request)

    private readonly requestRepository: Repository<Request>,

    @InjectRepository(Review)

    private readonly reviewRepository: Repository<Review>,

    private readonly storageService: StorageService,

    private readonly dataSource: DataSource,

    @InjectRepository(Faculty)

    private readonly facultyRepo: Repository<Faculty>,

    @InjectRepository(Career)

    private readonly careerRepo: Repository<Career>,

    @InjectRepository(Subject)

    private readonly subjectRepo: Repository<Subject>,

  ) {}




  async executeSeed() {

    // Limpieza previa: tablas obsoletas y datos de negocio

    this.logger.log(

      'Limpieza de esquema (joins y tablas obsoletas) y datos...',

    );

    await this.deleteTables();




    // Catálogo: idempotente (se recrea en tablas singulares)

    this.logger.log(

      'Sincronizando catálogo (facultad/carrera/asignatura) en tablas singulares...',

    );

    await this.seedCatalogs();




    this.logger.log('Insertando usuarios tutores (Henry Carrasco)...');

    const dbUsers = await this.insertTutorUsers();




    this.logger.log('Insertando Oferta para tutores...');

    const dbOffers = await this.insertOffers(dbUsers);




    this.logger.log('Insertando horarios (schedules) para tutores...');

    await this.insertSchedules(dbUsers);




    this.logger.log('Insertando solicitudes (requests) de ejemplo...');

    const savedRequests = await this.insertRequests(dbUsers, dbOffers);




    if (savedRequests) {

      this.logger.log('Insertando reseñas (reviews) de ejemplo...');

      await this.insertReviews(dbUsers, savedRequests);

    }




    this.logger.log('SEED EJECUTADO EXITOSAMENTE');

    return 'EXECUTE SEED';

  }




  private async seedCatalogs() {

    // Datos hardcodeados del catálogo

    const catalogData = [

      {

        facultyName: 'Facultad de Ingeniería en Sistemas',

        careers: [

          {

            careerName: 'Ingeniería en Software',

            subjects: [

              { code: 'IS001', name: 'Programación I' },

              { code: 'IS002', name: 'Programación II' },

              { code: 'IS003', name: 'Estructuras de Datos' },

              { code: 'IS004', name: 'Algoritmos' },

              { code: 'IS005', name: 'Bases de Datos' },

              { code: 'IS006', name: 'Ingeniería de Software' },

              { code: 'IS007', name: 'Desarrollo Web' },

              { code: 'IS008', name: 'Desarrollo Móvil' },

            ],

          },

          {

            careerName: 'Ingeniería en Redes y Telecomunicaciones',

            subjects: [

              { code: 'RT001', name: 'Redes I' },

              { code: 'RT002', name: 'Redes II' },

              { code: 'RT003', name: 'Telecomunicaciones' },

            ],

          },

        ],

      },

      {

        facultyName: 'Facultad de Ciencias Administrativas',

        careers: [

          {

            careerName: 'Administración de Empresas',

            subjects: [

              { code: 'AE001', name: 'Contabilidad General' },

              { code: 'AE002', name: 'Marketing' },

              { code: 'AE003', name: 'Finanzas' },

            ],

          },

        ],

      },

    ];




    // Facultades (buscar/crear por nombre)

    for (const fac of catalogData) {

      let faculty = await this.facultyRepo.findOne({

        where: { faculty: fac.facultyName },

      });

      if (!faculty) {

        faculty = this.facultyRepo.create({

          faculty: fac.facultyName,

        });

      } else {

        faculty.faculty = fac.facultyName;

      }

      faculty = await this.facultyRepo.save(faculty);




      // Carreras de la facultad

      for (const car of fac.careers) {

        let career = await this.careerRepo.findOne({

          where: { careerName: car.careerName },

          relations: { faculty: true },

        });

        if (!career) {

          career = this.careerRepo.create({

            careerName: car.careerName,

            faculty,

          });

        } else {

          career.careerName = car.careerName;

          career.faculty = faculty;

        }

        career = await this.careerRepo.save(career);




        // Asignaturas de la carrera

        for (const sub of car.subjects) {

          let subject = await this.subjectRepo.findOne({

            where: { subjectCode: sub.code },

            relations: { career: true },

          });

          if (!subject) {

            subject = this.subjectRepo.create({

              subjectCode: sub.code,

              subjectName: sub.name,

              career,

            });

          } else {

            subject.subjectName = sub.name;

            subject.career = career;

          }

          await this.subjectRepo.save(subject);

        }

      }

    }

    this.logger.log('Catálogo sincronizado (idempotente).');

  }




  private async deleteTables() {

    const queryRunner = this.dataSource.createQueryRunner();

    await queryRunner.connect();




    try {

      // Desactivar restricciones de FK temporalmente para poder limpiar

      await queryRunner.query('SET session_replication_role = replica;');




      // Eliminar tablas obsoletas

      await queryRunner.query('DROP TABLE IF EXISTS "tutor_subjects"');

      await queryRunner.query('DROP TABLE IF EXISTS "student_subjects"');

      await queryRunner.query('DROP TABLE IF EXISTS "tutor_careers"');

      await queryRunner.query('DROP TABLE IF EXISTS "tutor"');

      await queryRunner.query('DROP TABLE IF EXISTS "student"');

      await queryRunner.query('DROP TABLE IF EXISTS "faculties" CASCADE');

      await queryRunner.query('DROP TABLE IF EXISTS "careers" CASCADE');

      await queryRunner.query('DROP TABLE IF EXISTS "subjects" CASCADE');

      await queryRunner.query('DROP TABLE IF EXISTS "oferts" CASCADE');




      // Limpiar tablas de reviews primero (depende de requests)

      await queryRunner.query('DELETE FROM "reviews"').catch(() => {});




      // Limpiar tablas de requests primero (depende de users y ofert)

      await queryRunner.query('DELETE FROM "requests"').catch(() => {});




      // Limpiar tablas de schedule (dependen de users)

      await queryRunner.query('DELETE FROM "slots"').catch(() => {});

      await queryRunner.query('DELETE FROM "days"').catch(() => {});

      await queryRunner.query('DELETE FROM "schedules"').catch(() => {});




      // Limpiar ofertas (dependen de users)

      await queryRunner.query('DELETE FROM "ofert"').catch(() => {});




      // Limpiar usuarios

      await queryRunner.query('DELETE FROM "users"').catch(() => {});




      // Limpiar catálogos

      await queryRunner.query('DELETE FROM "subject"').catch(() => {});

      await queryRunner.query('DELETE FROM "career"').catch(() => {});

      await queryRunner.query('DELETE FROM "faculty"').catch(() => {});




      // Reactivar restricciones de FK

      await queryRunner.query('SET session_replication_role = DEFAULT;');




      this.logger.log('Tablas limpiadas exitosamente');

    } catch (error) {

      this.logger.error('Error durante limpieza de tablas:', error);

      // Asegurarse de reactivar FK aunque haya error

      await queryRunner

        .query('SET session_replication_role = DEFAULT;')

        .catch(() => {});

    } finally {

      await queryRunner.release();

    }

  }




  private async insertTutorUsers() {

    const seedTutors = initialData.tutors;

    const users: User[] = [];




    for (const seedTutor of seedTutors) {

      // 1. Sube la imagen de perfil llamando al método correcto

      const imageUrl = await this.uploadSeedImage(seedTutor.image, 'profile');

      this.logger.log(`Imagen de usuario tutor subida: ${imageUrl}`);




      // Hash de la contraseña por defecto

      const hashedPassword = await bcrypt.hash('Password123', 10);




      // Buscar la facultad por nombre

      const facultyEntity = await this.facultyRepo.findOne({

        where: { faculty: seedTutor.faculty },

      });




      // Elegir una carrera del tutor (primera por defecto) y resolver a entidad

      let careerEntity: Career | undefined;

      if (seedTutor.carrersFaculty && seedTutor.carrersFaculty.length > 0) {

        const preferredCareerName = seedTutor.carrersFaculty[0].careerName;

        const foundCareer = await this.careerRepo.findOne({

          where: { careerName: preferredCareerName },

          relations: { faculty: true },

        });

        if (

          foundCareer &&

          (!facultyEntity ||

            foundCareer.faculty?.facultyId === facultyEntity.facultyId)

        ) {

          careerEntity = foundCareer;

        }

      }




      // Fallback: si no se encontró por nombre, tomar la primera carrera de la facultad del usuario

      if (!careerEntity && facultyEntity) {

        const firstCareerInFaculty = await this.careerRepo.findOne({

          where: { faculty: { facultyId: facultyEntity.facultyId } },

          relations: { faculty: true },

        });

        if (firstCareerInFaculty) careerEntity = firstCareerInFaculty;

      }




      // Crear usuario con rol tutor

      const user = this.userRepository.create({

        email: `${seedTutor.dni}@poli.edu.ec`,

        password: hashedPassword,

        name: seedTutor.name,

        lastName: seedTutor.lastName,

        dni: seedTutor.dni,

        uniqueCode: `UC-${seedTutor.dni}`,

        primaryPhone: seedTutor.primaryPhone || '0999999999',

        bio: `Tutor de ${seedTutor.faculty}`,

        faculty: facultyEntity ?? undefined,

        career: careerEntity ?? undefined,

        image: imageUrl,

        role: ['tutor'],

        isActive: true,

      });

      users.push(user);

    }




    const dbUsers = await this.userRepository.save(users);

    return dbUsers;

  }




  private async insertOffers(dbUsers: User[]) {

    const offerCreationPromises: Promise<Ofert>[] = [];




    for (const [index, seedTutor] of initialData.tutors.entries()) {

      const user = dbUsers[index];

      if (seedTutor.offers) {

        for (const offer of seedTutor.offers) {

          const offerPromise = (async () => {

            // 2. Sube la imagen de la oferta llamando al método correcto

            const imageUrl = await this.uploadSeedImage(offer.image, 'offer');

            this.logger.log(`Imagen de oferta subida: ${imageUrl}`);




            const careerEntity = await this.careerRepo.findOne({

              where: { careerName: offer.career },

            });

            const subjectEntity = offer.subject

              ? await this.subjectRepo.findOne({

                  where: { subjectName: offer.subject },

                })

              : null;




            return this.ofertRepository.save(

              this.ofertRepository.create({

                career: careerEntity!,

                subject: subjectEntity ?? undefined,

                mode: offer.mode,

                price: offer.price,

                description: offer.description,

                indications: offer.indications,

                image: imageUrl,

                user: user,

              }),

            );

          })();

          offerCreationPromises.push(offerPromise);

        }

      }

    }




    const dbOffers = await Promise.all(offerCreationPromises);

    return dbOffers;

  }




  private async uploadSeedImage(

    localFileName: string,

    type: 'profile' | 'offer',

  ): Promise<string> {

    try {

      const basePath = __dirname.includes('dist')

        ? path.join(__dirname, 'images')

        : path.join(process.cwd(), 'src', 'seed', 'images');




      const imagePath = path.join(basePath, localFileName);

      const fileBuffer = fs.readFileSync(imagePath);




      const file: Express.Multer.File = {

        originalname: localFileName,

        mimetype: localFileName.endsWith('.png') ? 'image/png' : 'image/jpeg',

        buffer: fileBuffer,

        size: fileBuffer.length,

        fieldname: 'file',

        encoding: '7bit',

        destination: '',

        filename: localFileName,

        path: imagePath,

        stream: Readable.from(fileBuffer),

      };




      // Subir al contenedor correspondiente (SIN regenerar SAS)

      const sasUrl =

        type === 'profile'

          ? await this.storageService.uploadProfileFile(file)

          : await this.storageService.uploadOfferFile(file);




      this.logger.log(

        `Imagen ${type === 'profile' ? 'de perfil' : 'de oferta'} subida: ${sasUrl}`,

      );




      return sasUrl;

    } catch (error) {

      const msg = error instanceof Error ? error.message : String(error);

      this.logger.error(`Error subiendo imagen ${localFileName}:`, msg);

      return 'https://example.com/error-placeholder.jpg';

    }

  }




  private async insertSchedules(dbUsers: User[]) {

    const schedules: Schedule[] = [];




    // Crear horarios para cada tutor

    for (const user of dbUsers) {

      // Crear horario para la semana actual

      const today = new Date();

      const currentDay = today.getDay(); // 0 = domingo, 1 = lunes, etc.




      // Calcular inicio de semana actual (lunes)

      const weekStart = new Date(today);

      weekStart.setUTCDate(

        today.getUTCDate() - (currentDay === 0 ? 6 : currentDay - 1),

      );

      weekStart.setUTCHours(0, 0, 0, 0);




      // Calcular fin de semana laboral (viernes)

      const weekEnd = new Date(weekStart);

      weekEnd.setUTCDate(weekStart.getUTCDate() + 4);

      weekEnd.setUTCHours(23, 59, 59, 999);




      // Crear schedule para semana actual

      const schedule = this.scheduleRepository.create({

        id: uuidv4(),

        weekStart,

        weekEnd,

        isEditable: true,

        user,

        days: [],

      });




      // Crear días de la semana

      const days: any[] = [];

      const dayNames = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes'];




      for (let i = 0; i < dayNames.length; i++) {

        const dayDate = new Date(weekStart);

        dayDate.setUTCDate(weekStart.getUTCDate() + i);




        // Crear slots para el día (08:00 a 18:00)

        const slots: any[] = [];

        const hours = [

          '08:00',

          '09:00',

          '10:00',

          '11:00',

          '12:00',

          '13:00',

          '14:00',

          '15:00',

          '16:00',

          '17:00',

          '18:00',

        ];




        for (const hour of hours) {

          slots.push({

            id: uuidv4(),

            hour,

            state: 'available',

          });

        }




        days.push({

          id: uuidv4(),

          name: dayNames[i],

          date: dayDate,

          slots,

        });

      }




      schedule.days = days;

      schedules.push(schedule);

    }




    await this.scheduleRepository.save(schedules);

    this.logger.log(`${schedules.length} horarios creados exitosamente`);

  }




  private async insertRequests(dbUsers: User[], dbOffers: Ofert[]) {

    if (dbOffers.length === 0) {

      this.logger.warn(

        'No hay ofertas disponibles, omitiendo creación de requests',

      );

      return;

    }




    const requests: Request[] = [];




    // Crear 2 estudiantes para simular conflictos

    const hashedPassword = await bcrypt.hash('Password123', 10);




    let student1 = await this.userRepository.findOne({

      where: [{ email: 'estudiante1@poli.edu.ec' }, { dni: '1111111111' }],

    });

    if (!student1) {

      student1 = await this.userRepository.save(

        this.userRepository.create({

          email: 'estudiante1@poli.edu.ec',

          password: hashedPassword,

          name: 'Maria',

          lastName: 'Garcia',

          dni: '1111111111',

          uniqueCode: 'UC-STUDENT-001',

          primaryPhone: '0911111111',

          bio: 'Estudiante de Ingeniería en Software',

          role: ['student'],

          isActive: true,

        }),

      );

    }




    let student2 = await this.userRepository.findOne({

      where: [{ email: 'estudiante2@poli.edu.ec' }, { dni: '2222222222' }],

    });

    if (!student2) {

      student2 = await this.userRepository.save(

        this.userRepository.create({

          email: 'estudiante2@poli.edu.ec',

          password: hashedPassword,

          name: 'Carlos',

          lastName: 'Lopez',

          dni: '2222222222',

          uniqueCode: 'UC-STUDENT-002',

          primaryPhone: '0922222222',

          bio: 'Estudiante de Ingeniería en Sistemas',

          role: ['student'],

          isActive: true,

        }),

      );

    }




    let student3 = await this.userRepository.findOne({

      where: [{ email: 'estudiante3@poli.edu.ec' }, { dni: '3333333333' }],

    });

    if (!student3) {

      student3 = await this.userRepository.save(

        this.userRepository.create({

          email: 'estudiante3@poli.edu.ec',

          password: hashedPassword,

          name: 'Ana',

          lastName: 'Martinez',

          dni: '3333333333',

          uniqueCode: 'UC-STUDENT-003',

          primaryPhone: '0933333333',

          bio: 'Estudiante de Redes',

          role: ['student'],

          isActive: true,

        }),

      );

    }




    const offer = dbOffers[0]; // Usamos la primera oferta para crear conflictos




    // Fechas dinámicas: lunes a viernes de la semana actual

    const today = new Date();

    const dayOfWeek = today.getDay(); // 0=domingo, 1=lunes, ...

    // Calcular el lunes de la semana actual

    const monday = new Date(today);

    monday.setDate(today.getDate() - ((dayOfWeek + 6) % 7));

    monday.setHours(0, 0, 0, 0);

    // Crear fechas para lunes a viernes

    const weekdayDates: Date[] = [];

    for (let i = 0; i < 5; i++) {

      const d = new Date(monday);

      d.setDate(monday.getDate() + i);

      weekdayDates.push(d);

    }

    // Usar weekdayDates[0] = lunes, [1]=martes, ...




    // Solicitudes con CONFLICTO (misma oferta, mismo día, mismas horas, diferentes estudiantes)

    // Estudiante 1 y 2 piden las MISMAS horas = CONFLICTO

    const conflictDate = weekdayDates[1]; // martes

    const conflictHours = ['09:00', '10:00'];




    const request1 = this.requestRepository.create({

      offerId: offer.id,

      studentId: student1.id,

      studentEmail: student1.email,

      studentPhone: student1.primaryPhone,

      studentMessage:

        'Necesito ayuda con estructuras de datos, específicamente árboles binarios.',

      date: conflictDate,

      hours: conflictHours,

      paymentMethod: 'transfer',

      status: 'conflict', // Ambas en conflicto

      price: offer.price,

      createdAt: new Date(),

      isReviewed: false,

    });

    requests.push(request1);




    const request2 = this.requestRepository.create({

      offerId: offer.id,

      studentId: student2.id,

      studentEmail: student2.email,

      studentPhone: student2.primaryPhone,

      studentMessage:

        'Me interesa tutoría para preparar el examen final de programación.',

      date: conflictDate,

      hours: conflictHours, // MISMAS HORAS = CONFLICTO

      paymentMethod: 'cash',

      status: 'conflict', // Ambas en conflicto

      price: offer.price,

      createdAt: new Date(),

      isReviewed: false,

    });

    requests.push(request2);




    // Solicitud sin conflicto (diferente día)

    const request3 = this.requestRepository.create({

      offerId: offer.id,

      studentId: student3.id,

      studentEmail: student3.email,

      studentPhone: student3.primaryPhone,

      studentMessage:

        'Requiero apoyo con algoritmos de ordenamiento y búsqueda.',

      date: weekdayDates[2], // miércoles

      hours: ['11:00', '12:00'],

      paymentMethod: 'transfer',

      status: 'pending',

      price: offer.price,

      createdAt: new Date(),

      isReviewed: false,

    });

    requests.push(request3);




    // Solicitud ya confirmada (scheduled)

    const request4 = this.requestRepository.create({

      offerId: offer.id,

      studentId: student1.id,

      studentEmail: student1.email,

      studentPhone: student1.primaryPhone,

      studentMessage: 'Sesión confirmada para la próxima semana.',

      date: weekdayDates[4], // viernes

      hours: ['14:00', '15:00'],

      paymentMethod: 'transfer',

      status: 'scheduled',

      price: offer.price,

      createdAt: new Date(),

      isReviewed: true,

    });

    requests.push(request4);




    // Solicitud expirada (fecha pasada)

    const request5 = this.requestRepository.create({

      offerId: offer.id,

      studentId: student2.id,

      studentEmail: student2.email,

      studentPhone: student2.primaryPhone,

      studentMessage: 'Esta solicitud expiró.',

      date: weekdayDates[1], // martes

      hours: ['10:00'],

      paymentMethod: 'cash',

      status: 'expired',

      price: offer.price,

      createdAt: new Date(),

      isReviewed: false,

    });

    requests.push(request5);




    // Solicitud scheduled para el próximo día hábil (con slots ocupados)

    const request6 = this.requestRepository.create({

      offerId: offer.id,

      studentId: student3.id,

      studentEmail: student3.email,

      studentPhone: student3.primaryPhone,

      studentMessage: 'Tutoría confirmada para el próximo día hábil.',

      date: weekdayDates[1], // martes

      hours: ['16:00', '17:00'],

      paymentMethod: 'transfer',

      status: 'scheduled',

      price: offer.price * 2,

      createdAt: new Date(),

      isReviewed: true,

    });

    requests.push(request6);




    // ============ SOLICITUDES FINALIZADAS (semana anterior) ============




    // Tutoría finalizada hace 3 días

    const request7 = this.requestRepository.create({

      offerId: offer.id,

      studentId: student1.id,

      studentEmail: student1.email,

      studentPhone: student1.primaryPhone,

      studentMessage: 'Tutoría sobre algoritmos de ordenamiento completada.',

      date: weekdayDates[2], // miércoles

      hours: ['10:00', '11:00'],

      paymentMethod: 'transfer',

      status: 'finished',

      price: offer.price * 2,

      createdAt: weekdayDates[2],

      isReviewed: true,

    });

    requests.push(request7);




    // Tutoría finalizada hace 5 días

    const request8 = this.requestRepository.create({

      offerId: offer.id,

      studentId: student2.id,

      studentEmail: student2.email,

      studentPhone: student2.primaryPhone,

      studentMessage: 'Sesión de refuerzo en programación orientada a objetos.',

      date: weekdayDates[3], // jueves

      hours: ['14:00', '15:00', '16:00'],

      paymentMethod: 'cash',

      status: 'finished',

      price: offer.price * 3,

      createdAt: weekdayDates[3],

      isReviewed: true,

    });

    requests.push(request8);




    // Tutoría finalizada hace 7 días

    const request9 = this.requestRepository.create({

      offerId: offer.id,

      studentId: student3.id,

      studentEmail: student3.email,

      studentPhone: student3.primaryPhone,

      studentMessage:

        'Preparación para examen parcial de estructuras de datos.',

      date: weekdayDates[4], // viernes

      hours: ['09:00', '10:00'],

      paymentMethod: 'transfer',

      status: 'finished',

      price: offer.price * 2,

      createdAt: weekdayDates[4],

      isReviewed: false, // Aún no ha dejado reseña

    });

    requests.push(request9);




    // Otra tutoría finalizada hace 5 días (diferente estudiante)

    const request10 = this.requestRepository.create({

      offerId: offer.id,

      studentId: student1.id,

      studentEmail: student1.email,

      studentPhone: student1.primaryPhone,

      studentMessage: 'Revisión de proyecto final de programación.',

      date: weekdayDates[3], // jueves

      hours: ['08:00', '09:00'],

      paymentMethod: 'transfer',

      status: 'finished',

      price: offer.price * 2,

      createdAt: weekdayDates[3],

      isReviewed: true,

    });

    requests.push(request10);




    // Tutoría expirada (estudiante no asistió) - hace 4 días




    // Tutoría cancelada por el estudiante - hace 6 días

    const lastWeekday6 = new Date();

    lastWeekday6.setDate(lastWeekday6.getDate() - 6);

    lastWeekday6.setHours(0, 0, 0, 0);




    const request12 = this.requestRepository.create({

      offerId: offer.id,

      studentId: student3.id,

      studentEmail: student3.email,

      studentPhone: student3.primaryPhone,

      studentMessage: 'Ayuda con algoritmos de búsqueda.',

      date: lastWeekday6,

      hours: ['13:00', '14:00'],

      paymentMethod: 'transfer',

      status: 'cancelled',

      cancellationReason: 'cancelled_student',

      cancellationMessage: 'Tuve un imprevisto familiar y no pude asistir.',

      price: offer.price * 2,

      createdAt: lastWeekday6,

      updatedAt: lastWeekday6,

      isReviewed: false,

    });

    requests.push(request12);




    // Tutoría cancelada por el tutor - hace 8 días

    const lastWeekday8 = new Date();

    lastWeekday8.setDate(lastWeekday8.getDate() - 8);

    lastWeekday8.setHours(0, 0, 0, 0);




    const request13 = this.requestRepository.create({

      offerId: offer.id,

      studentId: student1.id,

      studentEmail: student1.email,

      studentPhone: student1.primaryPhone,

      studentMessage: 'Refuerzo en base de datos relacionales.',

      date: lastWeekday8,

      hours: ['15:00', '16:00'],

      paymentMethod: 'transfer',

      status: 'rejected',

      cancellationReason: 'rejected_tutor',

      cancellationMessage: 'Tuve un compromiso académico de último momento.',

      price: offer.price * 2,

      createdAt: lastWeekday8,

      updatedAt: lastWeekday8,

      isReviewed: false,

    });

    requests.push(request13);




    await this.requestRepository.save(requests);

    this.logger.log(`${requests.length} solicitudes creadas exitosamente`);




    // Ocupar los slots para las solicitudes scheduled (request4 y request6)

    const tutor = dbUsers[0]; // Primer tutor

    await this.occupySlotsForRequest(

      tutor,

      request4.date,

      request4.hours,

      request4.id,

    );

    await this.occupySlotsForRequest(

      tutor,

      request6.date,

      request6.hours,

      request6.id,

    );

    this.logger.log('Slots ocupados para solicitudes scheduled');




    this.logger.log('Estudiantes de prueba:');

    this.logger.log(`  - estudiante1@poli.edu.ec (María García) - Password123`);

    this.logger.log(`  - estudiante2@poli.edu.ec (Carlos López) - Password123`);

    this.logger.log(`  - estudiante3@poli.edu.ec (Ana Martínez) - Password123`);




    // Retornar datos necesarios para crear reseñas

    return {

      requests,

      students: { student1, student2, student3 },

      tutor: dbUsers[0],

    };

  }




  /**

   * Inserta reseñas de ejemplo para las tutorías finalizadas

   */

  private async insertReviews(

    dbUsers: User[],

    requestsData: {

      requests: Request[];

      students: { student1: User; student2: User; student3: User };

      tutor: User;

    },

  ) {

    if (!requestsData) {

      this.logger.warn(

        'No hay datos de requests, omitiendo creación de reviews',

      );

      return;

    }




    const { requests, students, tutor } = requestsData;

    // students contiene student1, student2, student3 pero usamos studentId de finishedRequests

    void students; // Marcar como usado para evitar warning de lint




    // Filtrar solo las solicitudes finalizadas que tienen hasReview = true

    const finishedRequests = requests.filter(

      (r) => r.status === 'finished' && r.hasReview === true,

    );




    if (finishedRequests.length === 0) {

      this.logger.warn('No hay solicitudes finalizadas para crear reseñas');

      return;

    }




    const reviews: Review[] = [];




    // Reseña 1: 5 estrellas con comentario

    const review1 = this.reviewRepository.create({

      requestId: finishedRequests[0]?.id,

      studentId: finishedRequests[0]?.studentId,

      tutorId: tutor.id,

      rating: 5,

      comment:

        'Excelente tutor, explica muy bien los conceptos de algoritmos. Muy recomendado para cualquier estudiante que necesite ayuda.',

      createdAt: new Date(Date.now() - 3 * 24 * 60 * 60 * 1000), // hace 3 días

    });

    reviews.push(review1);




    // Reseña 2: 4 estrellas con comentario

    if (finishedRequests[1]) {

      const review2 = this.reviewRepository.create({

        requestId: finishedRequests[1].id,

        studentId: finishedRequests[1].studentId,

        tutorId: tutor.id,

        rating: 4,

        comment:

          'Muy buena tutoría de POO. Me ayudó a entender herencia y polimorfismo. Solo tardó un poco en llegar.',

        createdAt: new Date(Date.now() - 5 * 24 * 60 * 60 * 1000), // hace 5 días

      });

      reviews.push(review2);

    }




    // Reseña 3: 5 estrellas sin comentario

    if (finishedRequests[2]) {

      const review3 = this.reviewRepository.create({

        requestId: finishedRequests[2].id,

        studentId: finishedRequests[2].studentId,

        tutorId: tutor.id,

        rating: 5,

        comment: undefined,

        createdAt: new Date(Date.now() - 5 * 24 * 60 * 60 * 1000), // hace 5 días

      });

      reviews.push(review3);

    }




    await this.reviewRepository.save(reviews);

    this.logger.log(`${reviews.length} reseñas creadas exitosamente`);




    // Marcar las requests con hasReview = true

    for (const review of reviews) {

      await this.requestRepository.update(

        { id: review.requestId },

        { hasReview: true },

      );

    }

  }




  /**

   * Ocupa los slots del horario del tutor para una solicitud confirmada

   */

  private async occupySlotsForRequest(

    tutor: User,

    date: Date,

    hours: string[],

    requestId: string,

  ): Promise<void> {

    const normalizedDate = date.toISOString().split('T')[0];




    // Buscar TODOS los schedules del tutor con días y slots

    const schedules = await this.scheduleRepository.find({

      where: { user: { id: tutor.id } },

      relations: ['days', 'days.slots'],

    });




    if (!schedules.length) {

      this.logger.warn(`No se encontró schedule para tutor ${tutor.email}`);

      return;

    }




    // Buscar el día en todos los schedules

    let targetDay: Day | null = null;

    for (const schedule of schedules) {

      const day = schedule.days.find((d) => {

        const dayDate = new Date(d.date).toISOString().split('T')[0];

        return dayDate === normalizedDate;

      });

      if (day) {

        targetDay = day;

        break;

      }

    }




    if (!targetDay) {

      this.logger.warn(`No se encontró día para fecha ${normalizedDate}`);

      return;

    }




    // Obtener el repository de Slot

    const slotRepository = this.dataSource.getRepository(Slot);




    // Actualizar los slots que coincidan con las horas

    for (const slot of targetDay.slots) {

      if (hours.includes(slot.hour)) {

        await slotRepository.update(

          { id: slot.id },

          { state: 'occupied', requestId },

        );

        this.logger.log(`Slot ${slot.hour} ocupado con requestId ${requestId}`);

      }

    }

  }

}







Quisiera revisar en Table+ pero solo me sale la arquitectura ningun dato, sera que debo apuntar a la db de staging ?
```

---

### Navegación

[← Prompt 046](/01-migracion-aws/046/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 048 →](/01-migracion-aws/048/)
{% endraw %}
