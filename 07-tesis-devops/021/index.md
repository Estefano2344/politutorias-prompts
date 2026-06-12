---
layout: default
title: '021. Antes de pasar al paso dos revisemos el seed que ahorita esta asi…'
parent: Redacción TIC DevOps
nav_order: 21
permalink: /07-tesis-devops/021/
---

{% raw %}

# Prompt 021
{: .no_toc }

**Sección:** Redacción TIC DevOps &middot; **Longitud:** 23,763 caracteres &middot; **Posición en la conversación:** 21 de 24

---

```
Antes de pasar al paso dos revisemos el seed que ahorita esta asi:

import { Career } from '../../catalogs/interfaces/faculty.interface';




interface SeedTutor {

    dni: string;

    name: string;

    lastName: string;

    faculty: string;

    image: string;

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

}




interface SeedData {

    tutors: SeedTutor[];

    students: SeedStudent[];

}




export const initialData: SeedData = {

    tutors: [

        {

            dni: "12345678",

            name: "Juan",

            lastName: "Pérez",

            faculty: "Facultad de Ingeniería en Sistemas",

            image: "https://example.com/placeholder-tutor1.jpg",

            carrersFaculty: [

                {

                    careerId: "1",

                    careerName: "Ingeniería de Software",

                    subjects: [

                        { subjectCode: 'MATD113', subjectName: 'Álgebra Lineal' },

                        { subjectCode: 'ICCD144', subjectName: 'Programación I' },

                        { subjectCode: 'ICCD244', subjectName: 'Programación II' },

                        { subjectCode: 'ICCD343', subjectName: 'Estructura de Datos y Algoritmos I' },

                        { subjectCode: 'ICCD442', subjectName: 'Estructura de Datos y Algoritmos II' },

                        { subjectCode: 'ICCD453', subjectName: 'Fundamentos de Bases de Datos' },

                        { subjectCode: 'ICCD512', subjectName: 'Ingeniería de Software I' },

                        { subjectCode: 'ICCD632', subjectName: 'Ingeniería de Software II' },

                        { subjectCode: 'ISWD613', subjectName: 'Aplicaciones Web' },

                        { subjectCode: 'ISWD713', subjectName: 'Aplicaciones Móviles' },

                    ]

                }

            ],

            offers: [

                {

                    career: "Ingeniería de Software",

                    subject: "Programación I",

                    mode: "Presencial",

                    price: 50

                },

                {

                    career: "Ingeniería de Software",

                    subject: "Estructura de Datos y Algoritmos I",

                    mode: "Virtual",

                    price: 60

                },

                {

                    career: "Ingeniería de Software",

                    subject: "Aplicaciones Web",

                    mode: "Presencial",

                    price: 70

                }

            ]

        },

        {

            dni: "87654321",

            name: "María",

            lastName: "Gómez",

            faculty: "Facultad de Ingeniería en Sistemas",

            image: "https://example.com/placeholder-tutor2.jpg",

            carrersFaculty: [

                {

                    careerId: "2",

                    careerName: "Computación",

                    subjects: [

                        { subjectCode: 'MATD113', subjectName: 'Álgebra Lineal' },

                        { subjectCode: 'ICCD144', subjectName: 'Programación I' },

                        { subjectCode: 'ICCD323', subjectName: 'Sistemas Operativos' },

                        { subjectCode: 'ICCD332', subjectName: 'Arquitectura de Computadores' },

                        { subjectCode: 'ICCD523', subjectName: 'Inteligencia Artificial' },

                        { subjectCode: 'ICCD623', subjectName: 'Data Mining y Machine Learning' },

                        { subjectCode: 'ICCD654', subjectName: 'Computación Distribuida' },

                        { subjectCode: 'ICCD733', subjectName: 'Seguridad Informática' },

                    ]

                }

            ],

            offers: [

                {

                    career: "Computación",

                    subject: "Sistemas Operativos",

                    mode: "Presencial",

                    price: 55

                },

                {

                    career: "Computación",

                    subject: "Inteligencia Artificial",

                    mode: "Virtual",

                    price: 65

                }

            ]

        },

        {

            dni: "11223344",

            name: "Carlos",

            lastName: "Rodríguez",

            faculty: "Facultad de Ingeniería Civil y Ambiental",

            image: "https://example.com/placeholder-tutor3.jpg",

            carrersFaculty: [

                {

                    careerId: "3",

                    careerName: "Ingeniería Civil",

                    subjects: [

                        { subjectCode: 'MATD113', subjectName: 'Álgebra Lineal' },

                        { subjectCode: 'MATD123', subjectName: 'Cálculo en una Variable' },

                        { subjectCode: 'CVLD244', subjectName: 'Mecánica para Ingenieros' },

                        { subjectCode: 'CVLD344', subjectName: 'Resistencia de Materiales' },

                        { subjectCode: 'CVLD443', subjectName: 'Resistencia de Materiales Vigas' },

                        { subjectCode: 'CVLD543', subjectName: 'Estructuras Planas' },

                        { subjectCode: 'CVLD642', subjectName: 'Estructuras y Pórticos' },

                        { subjectCode: 'CVLD743', subjectName: 'Análisis Matricial de Estructuras' },

                    ]

                }

            ],

            offers: [

                {

                    career: "Ingeniería Civil",

                    subject: "Resistencia de Materiales",

                    mode: "Presencial",

                    price: 45

                },

                {

                    career: "Ingeniería Civil",

                    subject: "Estructuras Planas",

                    mode: "Virtual",

                    price: 50

                }

            ]

        },

        {

            dni: "55667788",

            name: "Ana",

            lastName: "Martínez",

            faculty: "Facultad de Ingeniería Civil y Ambiental",

            image: "https://example.com/placeholder-tutor4.jpg",

            carrersFaculty: [

                {

                    careerId: "4",

                    careerName: "Ingeniería Ambiental",

                    subjects: [

                        { subjectCode: 'QUID143', subjectName: 'Química General' },

                        { subjectCode: 'AMBD243', subjectName: 'Física Ambiental' },

                        { subjectCode: 'AMBD313', subjectName: 'Balance de Masa y Energía' },

                        { subjectCode: 'AMBD424', subjectName: 'Calidad del Agua y Laboratorio' },

                        { subjectCode: 'AMBD533', subjectName: 'Agua Potable y Alcantarillado' },

                        { subjectCode: 'AMBD542', subjectName: 'Ecología y Ambiente' },

                        { subjectCode: 'AMBD713', subjectName: 'Legislación Ambiental' },

                        { subjectCode: 'AMBD823', subjectName: 'Evaluación de Impacto Ambiental' },

                    ]

                }

            ],

            offers: [

                {

                    career: "Ingeniería Ambiental",

                    subject: "Química General",

                    mode: "Presencial",

                    price: 40

                },

                {

                    career: "Ingeniería Ambiental",

                    subject: "Ecología y Ambiente",

                    mode: "Virtual",

                    price: 45

                }

            ]

        },

        {

            dni: "99887766",

            name: "Luis",

            lastName: "Fernández",

            faculty: "Facultad de Ingeniería en Sistemas",

            image: "https://example.com/placeholder-tutor5.jpg",

            carrersFaculty: [

                {

                    careerId: "1",

                    careerName: "Ingeniería de Software",

                    subjects: [

                        { subjectCode: 'ICCD463', subjectName: 'Redes de Computadoras I' },

                        { subjectCode: 'ICCD563', subjectName: 'Redes de Computadoras II' },

                        { subjectCode: 'ISWD643', subjectName: 'Tecnologías de Seguridad' },

                        { subjectCode: 'ICCD753', subjectName: 'Recuperación de la Información' },

                        { subjectCode: 'ICCD823', subjectName: 'Cloud Computing' },

                    ]

                }

            ],

            offers: [

                {

                    career: "Ingeniería de Software",

                    subject: "Redes de Computadoras I",

                    mode: "Presencial",

                    price: 55

                },

                {

                    career: "Ingeniería de Software",

                    subject: "Cloud Computing",

                    mode: "Virtual",

                    price: 75

                }

            ]

        },

        {

            dni: "33445566",

            name: "Sofia",

            lastName: "López",

            faculty: "Facultad de Ingeniería en Sistemas",

            image: "https://example.com/placeholder-tutor6.jpg",

            carrersFaculty: [

                {

                    careerId: "2",

                    careerName: "Computación",

                    subjects: [

                        { subjectCode: 'ICCD533', subjectName: 'Computación Gráfica' },

                        { subjectCode: 'ISWD553', subjectName: 'Bases de Datos Distribuidas' },

                        { subjectCode: 'ISWD723', subjectName: 'Interacción Humano-Computador' },

                        { subjectCode: 'ISWD743', subjectName: 'Business Intelligence' },

                        { subjectCode: 'ICCD814', subjectName: 'Modelos y Simulación' },

                    ]

                }

            ],

            offers: [

                {

                    career: "Computación",

                    subject: "Computación Gráfica",

                    mode: "Presencial",

                    price: 60

                },

                {

                    career: "Computación",

                    subject: "Business Intelligence",

                    mode: "Virtual",

                    price: 70

                }

            ]

        },

        {

            dni: "77889900",

            name: "Miguel",

            lastName: "García",

            faculty: "Facultad de Ingeniería Civil y Ambiental",

            image: "https://example.com/placeholder-tutor7.jpg",

            carrersFaculty: [

                {

                    careerId: "3",

                    careerName: "Ingeniería Civil",

                    subjects: [

                        { subjectCode: 'CVLD323', subjectName: 'Hidrología Básica' },

                        { subjectCode: 'CVLD333', subjectName: 'Hidráulica Básica' },

                        { subjectCode: 'CVLD423', subjectName: 'Hidrología Aplicada' },

                        { subjectCode: 'CVLD532', subjectName: 'Aplicaciones Computacionales en Hidráulica' },

                        { subjectCode: 'CVLD622', subjectName: 'Alcantarillado Urbano' },

                        { subjectCode: 'CVLD733', subjectName: 'Diseño Hidráulico' },

                    ]

                }

            ],

            offers: [

                {

                    career: "Ingeniería Civil",

                    subject: "Hidráulica Básica",

                    mode: "Presencial",

                    price: 50

                },

                {

                    career: "Ingeniería Civil",

                    subject: "Diseño Hidráulico",

                    mode: "Virtual",

                    price: 65

                }

            ]

        },

        {

            dni: "11224455",

            name: "Elena",

            lastName: "Torres",

            faculty: "Facultad de Ingeniería Civil y Ambiental",

            image: "https://example.com/placeholder-tutor8.jpg",

            carrersFaculty: [

                {

                    careerId: "4",

                    careerName: "Ingeniería Ambiental",

                    subjects: [

                        { subjectCode: 'AMB0323', subjectName: 'Química Orgánica y Laboratorio' },

                        { subjectCode: 'AMB0342', subjectName: 'Biología' },

                        { subjectCode: 'AMBD434', subjectName: 'Hidráulica Básica y Laboratorio' },

                        { subjectCode: 'AMBD522', subjectName: 'Procesos Industriales' },

                        { subjectCode: 'AMBD623', subjectName: 'Calidad y Control de la Contaminación del Suelo' },

                        { subjectCode: 'AMBD743', subjectName: 'Calidad y Control de la Contaminación del Aire' },

                        { subjectCode: 'AMBD752', subjectName: 'Ecotoxicología y Laboratorio' },

                    ]

                }

            ],

            offers: [

                {

                    career: "Ingeniería Ambiental",

                    subject: "Biología",

                    mode: "Presencial",

                    price: 45

                },

                {

                    career: "Ingeniería Ambiental",

                    subject: "Ecotoxicología y Laboratorio",

                    mode: "Virtual",

                    price: 55

                }

            ]

        }

    ],

    students: [

        {

            dni: "11111111",

            name: "Ana",

            lastName: "López",

            faculty: "Facultad de Ingeniería en Sistemas",

            image: "https://example.com/placeholder-student1.jpg",

            carrersFaculty: "Ingeniería de Software"

        },

        {

            dni: "22222222",

            name: "Carlos",

            lastName: "Rodríguez",

            faculty: "Facultad de Ingeniería en Sistemas",

            image: "https://example.com/placeholder-student2.jpg",

            carrersFaculty: "Computación"

        },

        {

            dni: "33333333",

            name: "Beatriz",

            lastName: "Hernández",

            faculty: "Facultad de Ingeniería Civil y Ambiental",

            image: "https://example.com/placeholder-student3.jpg",

            carrersFaculty: "Ingeniería Civil"

        },

        {

            dni: "44444444",

            name: "David",

            lastName: "Jiménez",

            faculty: "Facultad de Ingeniería Civil y Ambiental",

            image: "https://example.com/placeholder-student4.jpg",

            carrersFaculty: "Ingeniería Ambiental"

        },

        {

            dni: "55555555",

            name: "Eva",

            lastName: "Ruiz",

            faculty: "Facultad de Ingeniería en Sistemas",

            image: "https://example.com/placeholder-student5.jpg",

            carrersFaculty: "Ingeniería de Software"

        },

        {

            dni: "66666666",

            name: "Fernando",

            lastName: "Morales",

            faculty: "Facultad de Ingeniería en Sistemas",

            image: "https://example.com/placeholder-student6.jpg",

            carrersFaculty: "Computación"

        },

        {

            dni: "77777777",

            name: "Gabriela",

            lastName: "Ortiz",

            faculty: "Facultad de Ingeniería Civil y Ambiental",

            image: "https://example.com/placeholder-student7.jpg",

            carrersFaculty: "Ingeniería Civil"

        },

        {

            dni: "88888888",

            name: "Hugo",

            lastName: "Ramírez",

            faculty: "Facultad de Ingeniería Civil y Ambiental",

            image: "https://example.com/placeholder-student8.jpg",

            carrersFaculty: "Ingeniería Ambiental"

        },

        {

            dni: "99999999",

            name: "Isabel",

            lastName: "Sánchez",

            faculty: "Facultad de Ingeniería en Sistemas",

            image: "https://example.com/placeholder-student9.jpg",

            carrersFaculty: "Ingeniería de Software"

        },

        {

            dni: "10101010",

            name: "Javier",

            lastName: "Vargas",

            faculty: "Facultad de Ingeniería en Sistemas",

            image: "https://example.com/placeholder-student10.jpg",

            carrersFaculty: "Computación"

        },

        {

            dni: "11111112",

            name: "Karla",

            lastName: "Castro",

            faculty: "Facultad de Ingeniería Civil y Ambiental",

            image: "https://example.com/placeholder-student11.jpg",

            carrersFaculty: "Ingeniería Civil"

        },

        {

            dni: "12121212",

            name: "Luis",

            lastName: "Mendoza",

            faculty: "Facultad de Ingeniería Civil y Ambiental",

            image: "https://example.com/placeholder-student12.jpg",

            carrersFaculty: "Ingeniería Ambiental"

        },

        {

            dni: "13131313",

            name: "Mónica",

            lastName: "Guerrero",

            faculty: "Facultad de Ingeniería en Sistemas",

            image: "https://example.com/placeholder-student13.jpg",

            carrersFaculty: "Ingeniería de Software"

        },

        {

            dni: "14141414",

            name: "Nicolás",

            lastName: "Rojas",

            faculty: "Facultad de Ingeniería en Sistemas",

            image: "https://example.com/placeholder-student14.jpg",

            carrersFaculty: "Computación"

        },

        {

            dni: "15151515",

            name: "Olivia",

            lastName: "Paredes",

            faculty: "Facultad de Ingeniería Civil y Ambiental",

            image: "https://example.com/placeholder-student15.jpg",

            carrersFaculty: "Ingeniería Civil"

        },

        {

            dni: "16161616",

            name: "Pablo",

            lastName: "Silva",

            faculty: "Facultad de Ingeniería Civil y Ambiental",

            image: "https://example.com/placeholder-student16.jpg",

            carrersFaculty: "Ingeniería Ambiental"

        },

        {

            dni: "17171717",

            name: "Quincy",

            lastName: "Navarro",

            faculty: "Facultad de Ingeniería en Sistemas",

            image: "https://example.com/placeholder-student17.jpg",

            carrersFaculty: "Ingeniería de Software"

        },

        {

            dni: "18181818",

            name: "Rosa",

            lastName: "Delgado",

            faculty: "Facultad de Ingeniería en Sistemas",

            image: "https://example.com/placeholder-student18.jpg",

            carrersFaculty: "Computación"

        },

        {

            dni: "19191919",

            name: "Sergio",

            lastName: "Cabrera",

            faculty: "Facultad de Ingeniería Civil y Ambiental",

            image: "https://example.com/placeholder-student19.jpg",

            carrersFaculty: "Ingeniería Civil"

        },

        {

            dni: "20202020",

            name: "Teresa",

            lastName: "Flores",

            faculty: "Facultad de Ingeniería Civil y Ambiental",

            image: "https://example.com/placeholder-student20.jpg",

            carrersFaculty: "Ingeniería Ambiental"

        }

    ]

};







import { Controller, Get } from '@nestjs/common';

import { SeedService } from './seed.service';




@Controller('seed')

export class SeedController {

  constructor(private readonly seedService: SeedService) {}




  @Get()

  executeSeed() {

    return this.seedService.executeSeed();

  }

}







import { Module } from '@nestjs/common';

import { TypeOrmModule } from '@nestjs/typeorm';

import { SeedService } from './seed.service';

import { SeedController } from './seed.controller';

import { Tutor } from '../tutor/entities/tutor.entity';

import { Student } from '../student/entities/student.entity';

import { Ofert } from '../oferts/entities/ofert.entity';




@Module({

  controllers: [SeedController],

  providers: [SeedService],

  imports: [TypeOrmModule.forFeature([Tutor, Student, Ofert])],

})

export class SeedModule {}




import { Injectable } from '@nestjs/common';

import { InjectRepository } from '@nestjs/typeorm';

import { Repository } from 'typeorm';

import { Tutor } from '../tutor/entities/tutor.entity';

import { Student } from '../student/entities/student.entity';

import { Ofert } from '../oferts/entities/ofert.entity';

import { initialData } from './data/ofertas.data';




@Injectable()

export class SeedService {

  constructor(

    @InjectRepository(Tutor)

    private readonly tutorRepository: Repository<Tutor>,

    @InjectRepository(Student)

    private readonly studentRepository: Repository<Student>,

    @InjectRepository(Ofert)

    private readonly ofertRepository: Repository<Ofert>,

  ) {}




  async executeSeed() {

    await this.deleteTables();

    const dbTutors = await this.insertTutors();

    await this.insertOffers(dbTutors);

    await this.insertStudents();

    return "EXECUTE SEED";

  }




  private async deleteTables() {

    const ofertQueryBuilder = this.ofertRepository.createQueryBuilder();

    await ofertQueryBuilder.delete().where({}).execute();




    const tutorQueryBuilder = this.tutorRepository.createQueryBuilder();

    await tutorQueryBuilder.delete().where({}).execute();




    const studentQueryBuilder = this.studentRepository.createQueryBuilder();

    await studentQueryBuilder.delete().where({}).execute();

  }




  private async insertTutors() {

    const seedTutors = initialData.tutors;

    const tutors: Tutor[] = [];




    seedTutors.forEach(seedTutor => {

      const tutor = this.tutorRepository.create({

        dni: seedTutor.dni,

        name: seedTutor.name,

        lastName: seedTutor.lastName,

        faculty: seedTutor.faculty,

        image: seedTutor.image,

        carrersFaculty: seedTutor.carrersFaculty,

      });

      tutors.push(tutor);

    });




    const dbTutors = await this.tutorRepository.save(tutors);

    return dbTutors;

  }




  private async insertOffers(dbTutors: Tutor[]) {

    const insertPromises: Promise<any>[] = [];




    initialData.tutors.forEach((seedTutor, index) => {

      const tutor = dbTutors[index];

      seedTutor.offers?.forEach(offer => {

        insertPromises.push(

          this.ofertRepository.save(

            this.ofertRepository.create({

              career: offer.career,

              subject: offer.subject,

              mode: offer.mode,

              price: offer.price,

              tutor: tutor,

            })

          )

        );

      });

    });




    await Promise.all(insertPromises);

  }




  private async insertStudents() {

    const seedStudents = initialData.students;

    const students: Student[] = [];




    seedStudents.forEach(seedStudent => {

      const student = this.studentRepository.create({

        dni: seedStudent.dni,

        name: seedStudent.name,

        lastName: seedStudent.lastName,

        faculty: seedStudent.faculty,

        image: seedStudent.image,

        carrersFaculty: seedStudent.carrersFaculty,

      });

      students.push(student);

    });




    await this.studentRepository.save(students);

  }

}
```

---

### Navegación

[← Prompt 020](/07-tesis-devops/020/) &middot; [Volver a Redacción TIC DevOps](/07-tesis-devops/) &middot; [Prompt 022 →](/07-tesis-devops/022/)
{% endraw %}
