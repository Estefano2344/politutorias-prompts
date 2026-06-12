---
layout: default
title: '022. Dame todo el service modificado considerando que mis contenedores…'
parent: Redacción TIC DevOps
nav_order: 22
permalink: /07-tesis-devops/022/
---

{% raw %}

# Prompt 022
{: .no_toc }

**Sección:** Redacción TIC DevOps &middot; **Longitud:** 3,950 caracteres &middot; **Posición en la conversación:** 22 de 24

---

```
Dame todo el service modificado considerando que mis contenedores para las fotos de perfil tanto para estudiantes como para tutor es AZURE_STORAGE_CONTAINER_NAME_PROFILES="tutor-perfiles" y el de las imagenes que deben subir la tutoria AZURE_STORAGE_CONTAINER_NAME_OFFERS="tutorias-imagenes" Tambien quiero modificar el seed solo para que me cree solo pattricio chancusig como studiante y a henry carrasco solo con una oferta, donde esta tambien debe tener una imagen debido a como estan estructuradas:




import { BeforeInsert, Column, Entity, ManyToOne,Index,PrimaryGeneratedColumn, AfterInsert } from "typeorm";

import { Tutor } from '../../tutor/entities/tutor.entity';

import { Student } from "src/student/entities/student.entity";




@Entity('oferts')

@Index(['tutor', 'career', 'subject'], { unique: true })

export class Ofert {

    @PrimaryGeneratedColumn('uuid')

    id: string;




    @Column({

        type: "text",

        unique: false,




    })

    career: string;




    @Column({

        type: "text",

        unique: false,

        nullable: true,

    })

    subject: string;




    @Column({

        type: "text",

        default: 'In-person',

    })

    mode: string;




    @Column({

        type: "float",

        default: 0,

    })

    price: number;




    @Column({

        type: "text",

        nullable: true,

    })

    description: string;




    @Column({

        type: "text",

        nullable: true,

    })

    indications: string;




    @Column({

        type: "text",

        nullable: true,

    })

    image: string;




    @Column({

        type: "text",

        unique: true,

        nullable: true,

    })

    slug: string;

   

    @Column({

        type: "timestamptz",

        default: () => 'CURRENT_TIMESTAMP',

    })

    createdAt: Date;




    @ManyToOne(() => Tutor, (tutor) => tutor.oferts, {

        eager: false,

        nullable: false

    })

    tutor: Tutor;




    @ManyToOne(() => Student, (student) => student.oferts, {

        eager: false,

        nullable: true

    })

    student: Student;




    @AfterInsert()

    generateDatePosted() {

        this.createdAt = new Date();

    }




    @BeforeInsert()

    generateSlug() {

        this.mode = this.mode.toLowerCase();

        if (!this.slug) {

            this.slug = this.career.toLowerCase().replace(/ /g, '_') + '_' + Math.random().toString(36).substring(2, 8);

        }

    }

}




import { Faculty } from 'src/catalogs/interfaces/faculty.interface';

import { Ofert } from 'src/oferts/entities/ofert.entity';

import { Column, OneToMany, PrimaryGeneratedColumn, Entity } from 'typeorm';




@Entity()

export class Student {

  @PrimaryGeneratedColumn('uuid')

  id: string;




  @Column('text', { unique: true })

  dni: string;




  @Column('text')

  name: string;




  @Column('text')

  lastName: string;




  @Column('text', { nullable: false })

  faculty: string;




  @Column('text', { nullable: false })

  image: string;




  @Column('text', { nullable: true })

  carrersFaculty: string;




  @OneToMany(() => Ofert, (ofert) => ofert.student)

  oferts?: Ofert[];

}




import { Faculty } from '../../catalogs/interfaces/faculty.interface';

import { Ofert } from '../../oferts/entities/ofert.entity';

import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';




@Entity()

export class Tutor {

  //cedula nombre apellido carrera y facultad

  @PrimaryGeneratedColumn('uuid')

  id: string;




  @Column('text', { unique: true })

  dni: string;




  @Column('text')

  name: string;




  @Column('text')

  lastName: string;




  @Column('text', { nullable: false })

  faculty: string;




  @Column('text', { nullable: false })

  image: string;




  @Column('jsonb', { nullable: true })

  carrersFaculty?: Faculty['careers'];




  @OneToMany(() => Ofert, (ofert) => ofert.tutor)

  oferts: Ofert[];

}
```

---

### Navegación

[← Prompt 021](/07-tesis-devops/021/) &middot; [Volver a Redacción TIC DevOps](/07-tesis-devops/) &middot; [Prompt 023 →](/07-tesis-devops/023/)
{% endraw %}
