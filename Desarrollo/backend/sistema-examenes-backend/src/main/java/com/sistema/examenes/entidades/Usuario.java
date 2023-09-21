package com.sistema.examenes.entidades;

import jakarta.persistence.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "usuarios")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) //autoincrementable
    private Long id;
    private String username;
    private String password;
    private String nombre;
    private String apellidos;
    private String email;
    private String telefono;
    private boolean enable = true;
    private String perfil;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "usuario")
    private Set<UsuarioRol> usuarioRoles = new HashSet<>();
}
