{-  Website allowing interviewee to be assessed with pre-requisites for joining the ESGI. 
    Copyright (C) 2022 Amin NAIRI

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.  -}

port module Main exposing (main)


-- IMPORTS


import Browser
import Html exposing (Html, Attribute)
import Html.Attributes
import Html.Events

-- OUTGOING PORT

port vibrate : () -> Cmd message


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Message
subscriptions model =
  Sub.none


-- MESSAGE


type Message
  = CheckBranchPromotionRequirement Branch Promotion Requirement Bool
  | ResetBranchPromotionRequirements Branch Promotion
  | ResetAllBranchesPromotionsRequirements


-- FLAGS

type alias Flags = ()


-- MODEL

type alias Requirement =
  { name      : String
  , validated : Bool
  }


type alias Promotion =
  { name          : String
  , requirements  : List Requirement
  }


type alias Branch =
  { name        : String
  , identifier  : String
  , promotions  : List Promotion
  }


type alias Model =
  { branches : List Branch }


-- STATE


init : Flags -> (Model, Cmd Message)
init flags =
  ( { branches =
        [ { name = "Général"
          , identifier = "general"
          , promotions =
              [ { name = "Comportement"
                , requirements =
                    [ { name = "Souriant"
                      , validated = False
                      }
                    , { name = "Détendu"
                      , validated = False
                      }
                    , { name = "À l'aise à l'oral"
                      , validated = False
                      }
                    , { name = "Intéressé"
                      , validated = False
                      }
                    , { name = "Respectueux"
                      , validated = False
                      }
                    ]
                }
              , { name = "Scolarité"
                , requirements =
                    [ { name = "Peu d'absence"
                      , validated = False
                      }
                    , { name = "Bonnes appréciations"
                      , validated = False
                      }
                    , { name = "Bonnes notes"
                      , validated = False
                      }
                    ]
                }
              ]
          }
        , { name = "Ingénierie du Web"
          , identifier = "ingenierie-du-web"
          , promotions =
              [ { name = "3ème année"
                , requirements =
                    [ { name = "Modélisation de base de données SQL"
                      , validated = False
                      }
                    , { name = "Algorithmique et structures de données"
                      , validated = False
                      }
                    , { name = "Architecture des réseaux"
                      , validated = False
                      }
                    , { name = "Administration Linux"
                      , validated = False
                      }
                    , { name = "Architecture du Web"
                      , validated = False
                      }
                    , { name = "HTML"
                      , validated = False
                      }
                    , { name = "CSS"
                      , validated = False
                      }
                    , { name = "JavaScript"
                      , validated = False
                      }
                    , { name = "PHP"
                      , validated = False
                      }
                    , { name = "Modélisation et IHM"
                      , validated = False
                      }
                    , { name = "Modélisation UML"
                      , validated = False
                      }
                    , { name = "Programmation orientée objet"
                      , validated = False
                      }
                    , { name = "Java"
                      , validated = False
                      }
                    , { name = "Versioning, Git & GitHub"
                      , validated = False
                      }
                    , { name = "Sécurité et vulnérabilités informatiques"
                      , validated = False
                      }
                    , { name = "Cloud computing"
                      , validated = False
                      }
                    , { name = "Développement d'API HTTP"
                      , validated = False
                      }
                    , { name = "Gestion de projet"
                      , validated = False
                      }
                    , { name = "Anglais"
                      , validated = False
                      }
                    ]
                }
              , { name = "4ème année"
                , requirements =
                    [ { name = "Docker"
                      , validated = False
                      }
                    , { name = "Framework PHP Laravel"
                      , validated = False
                      }
                    , { name = "Panorama des CMS"
                      , validated = False
                      }
                    , { name = "Méthodes d'authentification"
                      , validated = False
                      }
                    , { name = "Figma & Conception d'UI"
                      , validated = False
                      }
                    , { name = "Méthodologie Agile"
                      , validated = False
                      }
                    , { name = "Marketing Digital"
                      , validated = False
                      }
                    ]
                }
              , { name = "5ème année"
                , requirements =
                    [ { name = "Tests unitaires, fonctionnels et d'interfaces"
                      , validated = False
                      }
                    , { name = "Environnement de travail collaboratif"
                      , validated = False
                      }
                    , { name = "Tests de performances et d'optimisation"
                      , validated = False
                      }
                    , { name = "UX & UI"
                      , validated = False
                      }
                    , { name = "Framework PHP Symfony"
                      , validated = False
                      }
                    , { name = "Node"
                      , validated = False
                      }
                    , { name = "Base de données NoSQL MongoDB"
                      , validated = False
                      }
                    , { name = "Framework JavaScript React & React Native"
                      , validated = False
                      }
                    , { name = "Elastic Search, Kibana & Logstash"
                      , validated = False
                      }
                    , { name = "Progressive Web Apps & Firebase"
                      , validated = False
                      }
                    , { name = "Référencement naturel"
                      , validated = False
                      }
                    ]
                }
              ]
          }
          , { name = "Sécurité Informatique"
            , identifier = "securite-informatique"
            , promotions =
                [ { name = "3ème année"
                  , requirements =
                      [ { name = "Mathématiques"
                        , validated = False
                        }
                      , { name = "Modélisation de base de données SQL"
                        , validated = False
                        }
                      , { name = "Algorithmique et structures de données"
                        , validated = False
                        }
                      , { name = "Langage C"
                        , validated = False
                        }
                      , { name = "Architecture des réseaux"
                        , validated = False
                        }
                      , { name = "Circuits logiques et architecture d'un ordinateur"
                        , validated = False
                        }
                      , { name = "Virtualisation et gestion de parcs informatiques"
                        , validated = False
                        }
                      , { name = "Administration système Linux"
                        , validated = False
                        }
                      , { name = "Administration système Windows"
                        , validated = False
                        }
                      , { name = "Architecture Web"
                        , validated = False
                        }
                      , { name = "Développement VBA"
                        , validated = False
                        }
                      , { name = "Théorie des systèmes d'exploitation"
                        , validated = False
                        }
                      , { name = "Versioning, Git & GitHub"
                        , validated = False
                        }
                      , { name = "Architecture et programmation Assembleur"
                        , validated = False
                        }
                      , { name = "Sécurité et vulnérabilités informatiques"
                        , validated = False
                        }
                      , { name = "Cloud Computing"
                        , validated = False
                        }
                      , { name = "Programmation orientée objet"
                        , validated = False
                        }
                      , { name = "Langage Java"
                        , validated = False
                        }
                      , { name = "Développement Mobile Android"
                        , validated = False
                        }
                      , { name = "Gestion de projet"
                        , validated = False
                        }
                      , { name = "Anglais"
                        , validated = False
                        }
                      ]
                  }
                , { name = "4ème année"
                  , requirements =
                      [ { name = "Listes, tris et arbres"
                        , validated = False
                        }
                      , { name = "Langage Python"
                        , validated = False
                        }
                      , { name = "LPIC 101 / RedHat I"
                        , validated = False
                        }
                      , { name = "CCNA"
                        , validated = False
                        }
                      , { name = "Routing et Switching"
                        , validated = False
                        }
                      , { name = "Cryptographie, clés et certificats"
                        , validated = False
                        }
                      , { name = "Détection de vulnérabilités"
                        , validated = False
                        }
                      , { name = "Sécurité Assembleur"
                        , validated = False
                        }
                      , { name = "Hardening des systèmes d'exploitation"
                        , validated = False
                        }
                      , { name = "Sécurité des réseaux Wi-Fi"
                        , validated = False
                        }
                      , { name = "Sécurité défensive et pérmimétrique d'un SI"
                        , validated = False
                        }
                      , { name = "Sécurité et intrusion physique"
                        , validated = False
                        }
                      , { name = "Certified Ethical Hacker"
                        , validated = False
                        }
                      , { name = "Kernel Windows, volatilité et Analyse de RAM"
                        , validated = False
                        }
                      , { name = "Gestion d'Exploits"
                        , validated = False
                        }
                      , { name = "Plannification de projet, cadrage, lots et MS Project"
                        , validated = False
                        }
                      ]
                  }
                , { name = "5ème année"
                  , requirements =
                      [ { name = "Programmation système & réseaux Linux"
                        , validated = False
                        }
                      , { name = "LPIC 2 / RedHat II"
                        , validated = False
                        }
                      , { name = "CCNA Security"
                        , validated = False
                        }
                      , { name = "Sécurité avancée des systèmes"
                        , validated = False
                        }
                      , { name = "Threat Hunting : détection des intrusions"
                        , validated = False
                        }
                      , { name = "Analyse Forensic"
                        , validated = False
                        }
                      , { name = "Sécurité du système d'information"
                        , validated = False
                        }
                      , { name = "Sécurité Python : volatilité, modularité et automatisation"
                        , validated = False
                        }
                      , { name = "Cryptographie avancée"
                        , validated = False
                        }
                      , { name = "Sécurité des objets connectés"
                        , validated = False
                        }
                      , { name = "Sécurité Shellcode"
                        , validated = False
                        }
                      , { name = "Reverse engineering : exploitation de binaires"
                        , validated = False
                        }
                      , { name = "Pentesting d'application Android"
                        , validated = False
                        }
                      , { name = "Gouvernance de la sécurité des SI"
                        , validated = False
                        }
                      , { name = "ISO 27001 Lead Auditor"
                        , validated = False
                        }
                      , { name = "EBIOS Risk Management"
                        , validated = False
                        }
                      , { name = "Sécurité du Cloud Computing"
                        , validated = False
                        }
                      ]
                  }
                ]
            }
          , { name = "Architecture des Logiciels"
            , identifier = "architecture-des-logiciels"
            , promotions =
                [ { name = "3ème année"
                  , requirements =
                      [ { name = "Mathématiques"
                        , validated = False
                        }
                      , { name = "Modélisation de base de données SQL"
                        , validated = False
                        }
                      , { name = "Algorithmique et structures de données"
                        , validated = False
                        }
                      , { name = "Langage C"
                        , validated = False
                        }
                      , { name = "Architecture des réseaux"
                        , validated = False
                        }
                      , { name = "Administration système Linux"
                        , validated = False
                        }
                      , { name = "Architecture Web"
                        , validated = False
                        }
                      , { name = "HTML"
                        , validated = False
                        }
                      , { name = "CSS"
                        , validated = False
                        }
                      , { name = "JavaScript"
                        , validated = False
                        }
                      , { name = "Modélisation d'IHM"
                        , validated = False
                        }
                      , { name = "Modélisation UML"
                        , validated = False
                        }
                      , { name = "Programmation orientée objet"
                        , validated = False
                        }
                      , { name = "Java"
                        , validated = False
                        }
                      , { name = "Versioning, Git & GitHub"
                        , validated = False
                        }
                      , { name = "Cloud Computing"
                        , validated = False
                        }
                      , { name = "Développement d'API HTTP"
                        , validated = False
                        }
                      , { name = "Théorie des systèmes d'exploitation"
                        , validated = False
                        }
                      , { name = "Développement mobile Android"
                        , validated = False
                        }
                      , { name = "Anglais"
                        , validated = False
                        }
                      ]
                  }
                , { name = "4ème année"
                  , requirements =
                      [ { name = "Scripting Python"
                        , validated = False
                        }
                      , { name = "Théorie des langages et compilation"
                        , validated = False
                        }
                      , { name = "Listes, tris & arbres"
                        , validated = False
                        }
                      , { name = "Outils et techniques de développement d'IA"
                        , validated = False
                        }
                      , { name = "Tests unitaires, fonctionnels et d'interface"
                        , validated = False
                        }
                      , { name = "Développement système Linux"
                        , validated = False
                        }
                      , { name = "Conception de base de données NoSQL"
                        , validated = False
                        }
                      , { name = "Node"
                        , validated = False
                        }
                      , { name = "Framework JavaScript Angular"
                        , validated = False
                        }
                      , { name = "Gestion de projet"
                        , validated = False
                        }
                      , { name = "Design Thinking"
                        , validated = False
                        }
                      , { name = "Méthodologie Agile et Scrum"
                        , validated = False
                        }
                      ]
                  }
                , { name = "5ème année"
                  , requirements =
                      [ { name = "Complexité algorithmique"
                        , validated = False
                        }
                      , { name = "Design Pattern"
                        , validated = False
                        }
                      , { name = "Langage C#"
                        , validated = False
                        }
                      , { name = "Framework Java J2E"
                        , validated = False
                        }
                      , { name = "Architecture logiciel"
                        , validated = False
                        }
                      , { name = "Bonnes pratiques & Clean Code"
                        , validated = False
                        }
                      , { name = "Orchestration de conteneurs"
                        , validated = False
                        }
                      , { name = "Intégration continue"
                        , validated = False
                        }
                      , { name = "Déploiement continu"
                        , validated = False
                        }
                      , { name = "Architecture micro-services"
                        , validated = False
                        }
                      , { name = "Langage Rust et programmation système & réseaux"
                        , validated = False
                        }
                      , { name = "Behavior Domain Development"
                        , validated = False
                        }
                      , { name = "Framework de Deep Learning"
                        , validated = False
                        }
                      ]
                  }
                ]
            }
          , { name = "Mobilité et Objets Connectés"
            , identifier = "mobilite-et-objets-connectes"
            , promotions =
                [ { name = "3ème année"
                  , requirements =
                      [ { name = "Modélisation de base de données SQL"
                        , validated = False
                        }
                      , { name = "Algorithmique et structures de données"
                        , validated = False
                        }
                      , { name = "Langage C"
                        , validated = False
                        }
                      , { name = "Architecture des réseaux"
                        , validated = False
                        }
                      , { name = "Circuits logiques et architecture d'un ordinateur"
                        , validated = False
                        }
                      , { name = "Administration système Linux"
                        , validated = False
                        }
                      , { name = "Architecture Web"
                        , validated = False
                        }
                      , { name = "HTML"
                        , validated = False
                        }
                      , { name = "CSS"
                        , validated = False
                        }
                      , { name = "JavaScript"
                        , validated = False
                        }
                      , { name = "Modélisation et IHM"
                        , validated = False
                        }
                      , { name = "Théorie des systèmes d'exploitation"
                        , validated = False
                        }
                      , { name = "Modélisation UML"
                        , validated = False
                        }
                      , { name = "Programmation orienté objet"
                        , validated = False
                        }
                      , { name = "Langage Java"
                        , validated = False
                        }
                      , { name = "Versioning, Git & GitHub"
                        , validated = False
                        }
                      , { name = "Architecture et programmation Assembleur"
                        , validated = False
                        }
                      , { name = "Sécurité et vulnérabilités informatiques"
                        , validated = False
                        }
                      , { name = "Cloud Computing"
                        , validated = False
                        }
                      , { name = "Plateforme Unity"
                        , validated = False
                        }
                      , { name = "Développement d'API HTTP"
                        , validated = False
                        }
                      , { name = "Développement mobile Android"
                        , validated = False
                        }
                      , { name = "Anglais"
                        , validated = False
                        }
                      , { name = "Gestion de projet"
                        , validated = False
                        }
                      , { name = "Anglais"
                        , validated = False
                        }
                      ]
                  }
                , { name = "4ème année"
                  , requirements =
                      [ { name = "Technologie Flutter"
                        , validated = False
                        }
                      , { name = "Listes, tris & arbres"
                        , validated = False
                        }
                      , { name = "Node"
                        , validated = False
                        }
                      , { name = "Programmation système et réseaux Linux"
                        , validated = False
                        }
                      , { name = "Langage Swift"
                        , validated = False
                        }
                      , { name = "Déploiement et reporting pour application mobile"
                        , validated = False
                        }
                      , { name = "Méthodologie Agile & Scrum"
                        , validated = False
                        }
                      , { name = "UX & UI mobile"
                        , validated = False
                        }
                      ]
                  }
                , { name = "5ème année"
                  , requirements =
                      [ { name = "Design Patterns"
                        , validated = False
                        }
                      , { name = "Langage C#"
                        , validated = False
                        }
                      , { name = "Clean Code"
                        , validated = False
                        }
                      , { name = "Éléctronique embarquée"
                        , validated = False
                        }
                      , { name = "Protocole d'échange de données"
                        , validated = False
                        }
                      , { name = "RTOS"
                        , validated = False
                        }
                      , { name = "Programmation C++"
                        , validated = False
                        }
                      , { name = "Programmation robotique"
                        , validated = False
                        }
                      , { name = "Programmation parallèle"
                        , validated = False
                        }
                      , { name = "Langage Kotlin"
                        , validated = False
                        }
                      , { name = "Intégration continue mobile"
                        , validated = False
                        }
                      , { name = "Gamification d'application"
                        , validated = False
                        }
                      , { name = "Firebase"
                        , validated = False
                        }
                      , { name = "Sécurité des applications mobiles"
                        , validated = False
                        }
                      ]
                  }
                ]
            }
          , { name = "Intelligence Artificielle et Big Data"
            , identifier = "intelligence-artificielle-et-big-data"
            , promotions =
                [ { name = "3ème année"
                  , requirements =
                      [ { name = "Mathématiques"
                        , validated = False
                        }
                      , { name = "Modélisation de bases de données SQL"
                        , validated = False
                        }
                      , { name = "Algorithmique et structures de données"
                        , validated = False
                        }
                      , { name = "Langage C"
                        , validated = False
                        }
                      , { name = "Architecture des réseaux"
                        , validated = False
                        }
                      , { name = "Administration système Linux"
                        , validated = False
                        }
                      , { name = "Architecture Web"
                        , validated = False
                        }
                      , { name = "Développement Excel & VBA"
                        , validated = False
                        }
                      , { name = "Modélisation et IHM"
                        , validated = False
                        }
                      , { name = "Modélisation UML"
                        , validated = False
                        }
                      , { name = "Programmation orientée objet"
                        , validated = False
                        }
                      , { name = "Langage Java"
                        , validated = False
                        }
                      , { name = "Versioning, Git & GitHub"
                        , validated = False
                        }
                      , { name = "Sécurité et vulnérabilités informatiques"
                        , validated = False
                        }
                      , { name = "Virtualisation de réseaux"
                        , validated = False
                        }
                      , { name = "Cloud Computing"
                        , validated = False
                        }
                      , { name = "Gestion de projet"
                        , validated = False
                        }
                      , { name = "Anglais"
                        , validated = False
                        }
                      ]
                  }
                , { name = "4ème année"
                  , requirements =
                      [ { name = "Mathématiques pour le Big Data"
                        , validated = False
                        }
                      , { name = "Combinatoire & complexité algorithmique"
                        , validated = False
                        }
                      , { name = "Scripting Python"
                        , validated = False
                        }
                      , { name = "Machine Learning & Frameworks"
                        , validated = False
                        }
                      , { name = "Conception de base de données NoSQL"
                        , validated = False
                        }
                      , { name = "Écosystème Hadoop"
                        , validated = False
                        }
                      ]
                  }
                , { name = "5ème année"
                  , requirements =
                      [ { name = "Langage R"
                        , validated = False
                        }
                      , { name = "Deep Learning"
                        , validated = False
                        }
                      , { name = "Deep Reinforcement Learning"
                        , validated = False
                        }
                      , { name = "Programmation Fonctionnelle"
                        , validated = False
                        }
                      , { name = "Langage Scala"
                        , validated = False
                        }
                      , { name = "DevOps"
                        , validated = False
                        }
                      , { name = "Environnement de développement et tests de production"
                        , validated = False
                        }
                      , { name = "Amazon Web Services"
                        , validated = False
                        }
                      , { name = "Spark Core"
                        , validated = False
                        }
                      , { name = "Spark Streaming"
                        , validated = False
                        }
                      , { name = "Microsoft Azure Cloud & Google Cloud Platform"
                        , validated = False
                        }
                      , { name = "Business Intelligence & Big Data"
                        , validated = False
                        }
                      , { name = "Reporting et restitution de données"
                        , validated = False
                        }
                      , { name = "Elastic Search"
                        , validated = False
                        }
                      , { name = "Sécurité du Big Data"
                        , validated = False
                        }
                      , { name = "Méthodologie Agile & Scrum"
                        , validated = False
                        }
                      ]
                  }
                ]
            }
          , { name = "Ingénierie de la Blockchain"
            , identifier = "ingenierie-de-la-blockchain"
            , promotions =
                [ { name = "3ème année"
                  , requirements =
                      [ { name = "Mathématiques"
                        , validated = False
                        }
                      , { name = "Modélisation de base de données SQL"
                        , validated = False
                        }
                      , { name = "Algoritmique et structures de données"
                        , validated = False
                        }
                      , { name = "Langage C"
                        , validated = False
                        }
                      , { name = "Architecture des réseaux"
                        , validated = False
                        }
                      , { name = "Virtualisation et gestion de parcs informatiques"
                        , validated = False
                        }
                      , { name = "Administration système Linux"
                        , validated = False
                        }
                      , { name = "Architecture Web"
                        , validated = False
                        }
                      , { name = "HTML"
                        , validated = False
                        }
                      , { name = "CSS"
                        , validated = False
                        }
                      , { name = "JavaScript"
                        , validated = False
                        }
                      , { name = "Modélisation et IHM"
                        , validated = False
                        }
                      , { name = "Modélisation UML"
                        , validated = False
                        }
                      , { name = "Programmation orientée objet"
                        , validated = False
                        }
                      , { name = "Langage Java"
                        , validated = False
                        }
                      , { name = "Versioning, Git & GitHub"
                        , validated = False
                        }
                      , { name = "Sécurité et vulnérabilités informatiques"
                        , validated = False
                        }
                      , { name = "Cloud Computing"
                        , validated = False
                        }
                      , { name = "Développement d'API HTTP"
                        , validated = False
                        }
                      , { name = "Gestion de projet"
                        , validated = False
                        }
                      , { name = "Anglais"
                        , validated = False
                        }
                      ]
                  }
                , { name = "4ème année"
                  , requirements =
                      [ { name = "Cryptographie"
                        , validated = False
                        }
                      , { name = "Signatures numériques"
                        , validated = False
                        }
                      , { name = "Fonctions de hashage"
                        , validated = False
                        }
                      , { name = "Smart Contracts, dApps & DAO"
                        , validated = False
                        }
                      , { name = "Structures de données"
                        , validated = False
                        }
                      , { name = "Protocole Bitcoin"
                        , validated = False
                        }
                      , { name = "Protocole Ethereum"
                        , validated = False
                        }
                      , { name = "Protocoles de consensus"
                        , validated = False
                        }
                      , { name = "Listes, tris & arbres"
                        , validated = False
                        }
                      , { name = "Langage Python"
                        , validated = False
                        }
                      , { name = "Bases de données NoSQL"
                        , validated = False
                        }
                      , { name = "MongoDB"
                        , validated = False
                        }
                      , { name = "Node"
                        , validated = False
                        }
                      , { name = "Conteneurisation Docker"
                        , validated = False
                        }
                      , { name = "Protocoles & services internet"
                        , validated = False
                        }
                      , { name = "Architectures des réseaux P2P"
                        , validated = False
                        }
                      , { name = "Métiers de la banque et des assurances"
                        , validated = False
                        }
                      , { name = "Réglementation des devises numériques"
                        , validated = False
                        }
                      ]
                  }
                , { name = "5ème année"
                  , requirements =
                      [ { name = "Décentralisation et échanges P2P"
                        , validated = False
                        }
                      , { name = "Hyperledger Fabric"
                        , validated = False
                        }
                      , { name = "Programmation système et réseaux Linux avec Rust"
                        , validated = False
                        }
                      , { name = "Langage Java & Framework Spring"
                        , validated = False
                        }
                      , { name = "Langage Go"
                        , validated = False
                        }
                      , { name = "Langage Scala et programmation fonctionnelle"
                        , validated = False
                        }
                      , { name = "Langage Solidity & Smart Contracts"
                        , validated = False
                        }
                      , { name = "Intégration & déploiement continu"
                        , validated = False
                        }
                      , { name = "Architecture Micro-services"
                        , validated = False
                        }
                      , { name = "Terraform & Vault"
                        , validated = False
                        }
                      , { name = "Kubernetes & Certification"
                        , validated = False
                        }
                      , { name = "Audit de Blockchain"
                        , validated = False
                        }
                      , { name = "Trading & analyse technique"
                        , validated = False
                        }
                      , { name = "Crypto-économie"
                        , validated = False
                        }
                      , { name = "Métier du notariat et des avocats"
                        , validated = False
                        }
                      ]
                  }
                ]
            }
          , { name = "Ingénierie de la 3D et des jeux-vidéos"
            , identifier = "ingenierie-de-la-3d-et-des-jeux-videos"
            , promotions =
                [ { name = "3ème année"
                  , requirements =
                      [ { name = "Mathématiques"
                        , validated = False
                        }
                      , { name = "Modélisation de bases de données SQL"
                        , validated = False
                        }
                      , { name = "Algorithmiques et structures de données"
                        , validated = False
                        }
                      , { name = "Langage C"
                        , validated = False
                        }
                      , { name = "Architecture des réseaux"
                        , validated = False
                        }
                      , { name = "Administration système Linux"
                        , validated = False
                        }
                      , { name = "Architecture Web"
                        , validated = False
                        }
                      , { name = "HTML"
                        , validated = False
                        }
                      , { name = "CSS"
                        , validated = False
                        }
                      , { name = "JavaScript"
                        , validated = False
                        }
                      , { name = "Modélisation et IHM"
                        , validated = False
                        }
                      , { name = "Modélisation UML"
                        , validated = False
                        }
                      , { name = "Programmation orientée objet"
                        , validated = False
                        }
                      , { name = "Langage Java"
                        , validated = False
                        }
                      , { name = "Versioning, Git & GitHub"
                        , validated = False
                        }
                      , { name = "Sécurité et vulnérabilités informatiques"
                        , validated = False
                        }
                      , { name = "Cloud Computing"
                        , validated = False
                        }
                      , { name = "Web API WebGL"
                        , validated = False
                        }
                      , { name = "Développement d'API HTTP"
                        , validated = False
                        }
                      , { name = "Infographie"
                        , validated = False
                        }
                      , { name = "Plateforme Unity"
                        , validated = False
                        }
                      , { name = "Développement Android"
                        , validated = False
                        }
                      , { name = "Gestion de projet"
                        , validated = False
                        }
                      , { name = "Anglais"
                        , validated = False
                        }
                      ]
                  }
                , { name = "4ème année"
                  , requirements =
                      [ { name = "Listes, tris & arbres"
                        , validated = False
                        }
                      , { name = "Recherche opérationnelle et Intelligence Artificielle"
                        , validated = False
                        }
                      , { name = "Langage C++"
                        , validated = False
                        }
                      , { name = "Scripting Bash"
                        , validated = False
                        }
                      , { name = "Langage Python"
                        , validated = False
                        }
                      , { name = "Librairie OpenGL"
                        , validated = False
                        }
                      , { name = "Game Design"
                        , validated = False
                        }
                      , { name = "Application créatives"
                        , validated = False
                        }
                      , { name = "Création 3D avec Blender"
                        , validated = False
                        }
                      , { name = "Création procédurale 3D"
                        , validated = False
                        }
                      ]
                  }
                , { name = "5ème année"
                  , requirements =
                      [ { name = "Raytracing"
                        , validated = False
                        }
                      , { name = "Programmation de Shaders"
                        , validated = False
                        }
                      , { name = "Animation procédurale"
                        , validated = False
                        }
                      , { name = "Réalité virtuelle & augmentée"
                        , validated = False
                        }
                      , { name = "Unreal Engine"
                        , validated = False
                        }
                      , { name = "Gamification"
                        , validated = False
                        }
                      , { name = "Histoire et culture des jeux-vidéo"
                        , validated = False
                        }
                      ]
                  }
                ]
            }
          , { name = "Systèmes, réseaux et Cloud Computing"
            , identifier = "systemes-reseaux-et-cloud-computing"
            , promotions =
                [ { name = "3ème année"
                  , requirements =
                      [ { name = "Langage C"
                        , validated = False
                        }
                      , { name = "Architecture des réseaux"
                        , validated = False
                        }
                      , { name = "Circuits logiques et architecture d'un ordinateur"
                        , validated = False
                        }
                      , { name = "Virtualisation et gestion de parcs informatiques"
                        , validated = False
                        }
                      , { name = "Architecture Web"
                        , validated = False
                        }
                      , { name = "Administration système Linux"
                        , validated = False
                        }
                      , { name = "Administration système Windows"
                        , validated = False
                        }
                      , { name = "Théorie des systèmes d'exploitation"
                        , validated = False
                        }
                      , { name = "Versioning, Git & GitHub"
                        , validated = False
                        }
                      , { name = "Sécurité et vulnérabilités informatiques"
                        , validated = False
                        }
                      , { name = "Virtualisation de réseaux"
                        , validated = False
                        }
                      , { name = "Cloud Computing"
                        , validated = False
                        }
                      , { name = "Conception de base de données SQL"
                        , validated = False
                        }
                      , { name = "Algorithmique et structures de données"
                        , validated = False
                        }
                      , { name = "Gestion de projet"
                        , validated = False
                        }
                      , { name = "Anglais"
                        , validated = False
                        }
                      ]
                  }
                , { name = "4ème année"
                  , requirements =
                      [ { name = "Scripting Python"
                        , validated = False
                        }
                      , { name = "Méthodologie de dépannage et supervison avec Nagios"
                        , validated = False
                        }
                      , { name = "Réseaux opérateurs"
                        , validated = False
                        }
                      , { name = "Microsoft Azure Cloud"
                        , validated = False
                        }
                      , { name = "Virtualisation VMWare & Certification"
                        , validated = False
                        }
                      , { name = "Certification LPIC 101 / RedHad I"
                        , validated = False
                        }
                      , { name = "Certification CCNA"
                        , validated = False
                        }
                      ]
                  }
                , { name = "5ème année"
                  , requirements =
                      [ { name = "Programmation système & réseaux en Python"
                        , validated = False
                        }
                      , { name = "Haute disponibilité"
                        , validated = False
                        }
                      , { name = "Scripting Powershell"
                        , validated = False
                        }
                      , { name = "Software Defined Network"
                        , validated = False
                        }
                      , { name = "Automatisation de virtualisation"
                        , validated = False
                        }
                      , { name = "Conteneurisation et DevOps"
                        , validated = False
                        }
                      , { name = "Amazon Web Services"
                        , validated = False
                        }
                      , { name = "Certification CCNP"
                        , validated = False
                        }
                      , { name = "Certification LPIC 2 / RedHat II"
                        , validated = False
                        }
                      ]
                  }
                ]
            }
          , { name = "Management & Conseil en Systèmes d'Information"
            , identifier = "management-et-conseil-en-systemes-d-information"
            , promotions =
                [ { name = "3ème année"
                  , requirements =
                      [ { name = "Droit informatique"
                        , validated = False
                        }
                      , { name = "Métiers de l'informatique"
                        , validated = False
                        }
                      , { name = "Entreprises du numérique"
                        , validated = False
                        }
                      , { name = "Gestion de projet"
                        , validated = False
                        }
                      , { name = "Gestion comptable"
                        , validated = False
                        }
                      , { name = "Métiers de la finance"
                        , validated = False
                        }
                      , { name = "Anglais informatique"
                        , validated = False
                        }
                      , { name = "Salesforce"
                        , validated = False
                        }
                      , { name = "SAP"
                        , validated = False
                        }
                      , { name = "WinDev"
                        , validated = False
                        }
                      , { name = "Modélisation UML"
                        , validated = False
                        }
                      , { name = "Versioning, Git & GitHub"
                        , validated = False
                        }
                      , { name = "Algorithmique et structures de données"
                        , validated = False
                        }
                      , { name = "Administration système Windows"
                        , validated = False
                        }
                      , { name = "Sécurité et vulnérabilités informatiques"
                        , validated = False
                        }
                      , { name = "Cloud Computing"
                        , validated = False
                        }
                      , { name = "Référencement naturel"
                        , validated = False
                        }
                      , { name = "CMS & Wordpress"
                        , validated = False
                        }
                      , { name = "Indicateurs clés de performance Web"
                        , validated = False
                        }
                      , { name = "Progressive Web Apps"
                        , validated = False
                        }
                      ]
                  }
                , { name = "4ème année"
                  , requirements =
                      [ { name = "Gestion de projet"
                        , validated = False
                        }
                      , { name = "Project planning"
                        , validated = False
                        }
                      , { name = "Gestion financière de projet"
                        , validated = False
                        }
                      , { name = "Méthodologie Agile & Scrum"
                        , validated = False
                        }
                      , { name = "Maîtrise d'ouvrage"
                        , validated = False
                        }
                      , { name = "Stratégie d'entreprise"
                        , validated = False
                        }
                      , { name = "Gouvernance des systèmes d'information"
                        , validated = False
                        }
                      , { name = "Sociologie des organisations"
                        , validated = False
                        }
                      , { name = "Gestion d'entreprise"
                        , validated = False
                        }
                      , { name = "Anglais professionnel"
                        , validated = False
                        }
                      , { name = "Présentation et argumentation"
                        , validated = False
                        }
                      , { name = "Architecture & réseaux"
                        , validated = False
                        }
                      , { name = "Bases de données"
                        , validated = False
                        }
                      , { name = "Systèmes d'exploitation"
                        , validated = False
                        }
                      , { name = "Systèmes d'information"
                        , validated = False
                        }
                      , { name = "Langages de programmation"
                        , validated = False
                        }
                      , { name = "ERP & CRM"
                        , validated = False
                        }
                      , { name = "Développement Excel"
                        , validated = False
                        }
                      , { name = "Transformation digitale"
                        , validated = False
                        }
                      , { name = "Typologie d'application"
                        , validated = False
                        }
                      ]
                  }
                , { name = "5ème année"
                  , requirements =
                      [ { name = "Comptabilité et finance d'entreprise"
                        , validated = False
                        }
                      , { name = "Ressources humaines"
                        , validated = False
                        }
                      , { name = "Marketing et commercial"
                        , validated = False
                        }
                      , { name = "Droit commercial"
                        , validated = False
                        }
                      , { name = "Métiers de la banque et des assurances"
                        , validated = False
                        }
                      , { name = "Stratégie d'entreprise"
                        , validated = False
                        }
                      , { name = "CRM & Microsoft Dynamics"
                        , validated = False
                        }
                      , { name = "Systèmes d'information décisionnels"
                        , validated = False
                        }
                      , { name = "Rédaction de cahier des charges"
                        , validated = False
                        }
                      , { name = "Pilotage d'équipe MOE"
                        , validated = False
                        }
                      , { name = "Tests logiciels et assurance qualité"
                        , validated = False
                        }
                      , { name = "Stratégie de déploiement"
                        , validated = False
                        }
                      , { name = "Négociation et gestion de conflit"
                        , validated = False
                        }
                      , { name = "Communication profesionnelle"
                        , validated = False
                        }
                      , { name = "Environnement et diversité culturelle"
                        , validated = False
                        }
                      , { name = "Gestion de projet international"
                        , validated = False
                        }
                      , { name = "Deep learning"
                        , validated = False
                        }
                      , { name = "Big Data"
                        , validated = False
                        }
                      ]
                  }
                ]
            }
        ]
    }
  , Cmd.none
  )


-- UPDATE


updateRequirementValidation : Requirement -> Bool -> Requirement -> Requirement
updateRequirementValidation requirement validated currentRequirement =
  if currentRequirement.name == requirement.name then
    { currentRequirement | validated = validated }

  else
    currentRequirement


updatePromotionRequirementValidation : Promotion -> Requirement -> Bool -> Promotion -> Promotion
updatePromotionRequirementValidation promotion requirement validated currentPromotion =
  if currentPromotion.name == promotion.name then
    { currentPromotion | requirements = List.map ( updateRequirementValidation requirement validated ) currentPromotion.requirements }

  else
    currentPromotion


updateBranchPromotionRequirementValidation : Branch -> Promotion -> Requirement -> Bool -> Branch -> Branch
updateBranchPromotionRequirementValidation branch promotion requirement validated currentBranch =
  if branch.name == currentBranch.name then
    { currentBranch | promotions = List.map ( updatePromotionRequirementValidation promotion requirement validated ) currentBranch.promotions }

  else
    currentBranch


resetRequirement : Requirement -> Requirement
resetRequirement requirement =
  { requirement | validated = False }


resetPromotionRequirements : Promotion -> Promotion -> Promotion
resetPromotionRequirements promotion currentPromotion =
  if currentPromotion.name == promotion.name then
    { currentPromotion | requirements = List.map resetRequirement currentPromotion.requirements }

  else
    currentPromotion 
    

resetBranchPromotionRequirements : Branch -> Promotion -> Branch -> Branch
resetBranchPromotionRequirements branch promotion currentBranch =
  if currentBranch.name == branch.name then
    { currentBranch | promotions = List.map ( resetPromotionRequirements promotion ) currentBranch.promotions }

  else
    currentBranch


resetAllRequirement : Requirement -> Requirement
resetAllRequirement requirement =
  { requirement | validated = False }


resetAllRequirements : List Requirement -> List Requirement
resetAllRequirements requirements =
  List.map resetAllRequirement requirements


resetAllPromotionRequirements : Promotion -> Promotion
resetAllPromotionRequirements promotion =
  { promotion | requirements = resetAllRequirements promotion.requirements }


resetAllPromotionsRequirements : List Promotion -> List Promotion
resetAllPromotionsRequirements promotions =
 List.map resetAllPromotionRequirements promotions


resetAllBranchPromotionsRequirements : Branch -> Branch
resetAllBranchPromotionsRequirements branch =
  { branch | promotions = resetAllPromotionsRequirements branch.promotions } 

resetAllBranchesPromotionsRequirements : List Branch -> List Branch
resetAllBranchesPromotionsRequirements branches =
  List.map resetAllBranchPromotionsRequirements branches


update : Message -> Model -> (Model, Cmd Message)
update action model = 
  case action of
    CheckBranchPromotionRequirement branch promotion requirement validated ->
      ( { model | branches = List.map ( updateBranchPromotionRequirementValidation branch promotion requirement validated ) model.branches }
      , vibrate ()
      )

    ResetBranchPromotionRequirements branch promotion ->
      ( { model | branches = List.map ( resetBranchPromotionRequirements branch promotion ) model.branches }
      , vibrate ()
      )

    ResetAllBranchesPromotionsRequirements ->
      ( { model | branches = resetAllBranchesPromotionsRequirements model.branches }
      , vibrate ()
      )

-- FUNCTIONS

viewButton : List ( Attribute Message ) -> List ( Html Message ) -> Html Message
viewButton attributes children =
  Html.button
    ( List.append
        [ Html.Attributes.style "font-family" "Roboto"
        , Html.Attributes.style "border-radius" "5px"
        , Html.Attributes.style "background-color" "black"
        , Html.Attributes.style "border" "none"
        , Html.Attributes.style "color" "white"
        , Html.Attributes.style "text-transform" "uppercase"
        , Html.Attributes.style "padding-left" "10px"
        , Html.Attributes.style "padding-right" "10px"
        , Html.Attributes.style "padding-top" "5px"
        , Html.Attributes.style "padding-bottom" "5px"
        , Html.Attributes.style "font-weight" "800"
        , Html.Attributes.style "cursor" "pointer"
        , Html.Attributes.style "display" "block"
        , Html.Attributes.style "margin-left" "auto"
        , Html.Attributes.style "margin-right" "auto"
        , Html.Attributes.style "margin-top" "10px"
        , Html.Attributes.style "transition" "all 0.25s ease-in-out"
        ]
        attributes
    )
    children


getPromotionRequirementsLength : Promotion -> Int
getPromotionRequirementsLength promotion =
  List.length promotion.requirements


isValidatedRequirement : Requirement -> Bool
isValidatedRequirement requirement =
  requirement.validated == True


getValidatedPromotionRequirementsLength : Promotion -> Int
getValidatedPromotionRequirementsLength promotion =
  promotion.requirements
    |> List.filter isValidatedRequirement
    |> List.length


doesNotMeetPromotionRequirements : Promotion -> Bool
doesNotMeetPromotionRequirements promotion =
  promotion
    |> getValidatedPromotionRequirementsLength
    |> (==) 0


doesNotMeetBranchesPromotionsRequirements : List Branch -> Bool  
doesNotMeetBranchesPromotionsRequirements branches =
  branches |> List.all (.promotions >> List.all (getValidatedPromotionRequirementsLength >> (==) 0))


-- VIEW


viewRequirement : Branch -> Promotion -> Requirement -> Html Message
viewRequirement branch promotion requirement =
  Html.label
    [ Html.Attributes.style "display" "block"
    , Html.Attributes.style "font-family" "Roboto"
    , Html.Attributes.style "font-weight" "300"
    , Html.Attributes.style "padding-top" "10px"
    , Html.Attributes.style "padding-bottom" "10px"
    , Html.Attributes.style "padding-bottom" "10px"
    , Html.Attributes.style "display" "flex"
    , Html.Attributes.style "flex-direction" "row"
    , Html.Attributes.style "justify-content" "flex-start"
    , Html.Attributes.style "align-items" "flex-start"
    ]
    [ Html.input
        [ Html.Attributes.checked requirement.validated
        , Html.Attributes.type_ "checkbox"
        , Html.Attributes.style "margin-right" "10px"
        , Html.Events.onCheck ( CheckBranchPromotionRequirement branch promotion requirement )
        ]
        []
    , Html.span
        [ Html.Attributes.style "color" (if requirement.validated then "#65a30d" else "black")
        , Html.Attributes.style "transition" "0.25s linear"
        ]
        [ Html.text requirement.name ]
    ]


viewRequirements : Branch -> Promotion -> List Requirement -> List ( Html Message )
viewRequirements branch promotion requirements =
  List.map ( viewRequirement branch promotion ) requirements


viewPromotionScore : Promotion -> String
viewPromotionScore promotion =
  " ( " ++ String.fromInt ( getValidatedPromotionRequirementsLength promotion ) ++ " / " ++ String.fromInt ( getPromotionRequirementsLength promotion ) ++ " )" 


viewPromotion : Branch -> Promotion -> Html Message
viewPromotion branch promotion =
  Html.div
    []
    [ Html.h3
      [ Html.Attributes.style "font-family" "Playfair Display"
      , Html.Attributes.style "font-weight" "400"
      , Html.Attributes.style "text-align" "center"
      , Html.Attributes.style "margin-bottom" "50px"
      , Html.Attributes.style "margin-top" "50px"
      ]
      [ Html.text promotion.name
      , Html.text ( viewPromotionScore promotion )
      , viewButton
        [ Html.Events.onClick ( ResetBranchPromotionRequirements branch promotion )
        , Html.Attributes.disabled (doesNotMeetPromotionRequirements promotion)
        , Html.Attributes.style "background-color" (if doesNotMeetPromotionRequirements promotion then "lightgrey" else "black")
        , Html.Attributes.style "color" (if doesNotMeetPromotionRequirements promotion then "grey" else "white")
        ]
        [ Html.text "Réinitialiser" ]
      ]
    , Html.div [] ( viewRequirements branch promotion promotion.requirements )
    ]


viewPromotions : Branch -> List ( Html Message )
viewPromotions branch =
  List.map ( viewPromotion branch ) branch.promotions


viewSeparation : Html Message
viewSeparation =
  Html.hr
  [ Html.Attributes.style "border" "1px solid rgba(0, 0, 0, 0.05)"
  , Html.Attributes.style "display" "block"
  , Html.Attributes.style "margin-top" "40px"
  ]
  []


viewLink : List ( Attribute Message ) -> List ( Html Message ) -> Html Message
viewLink attributes children =
  Html.a
    ( List.append
        [ Html.Attributes.style "text-decoration" "none"
        , Html.Attributes.style "color" "inherit"
        , Html.Attributes.style "text-align" "center"
        , Html.Attributes.style "display" "block"
        ]
        attributes
    )
    children 


viewBranch : Branch -> Html Message
viewBranch branch =
  Html.div
    []
    [ viewSeparation
    , Html.h2
        [ Html.Attributes.style "font-family" "Playfair Display"
        , Html.Attributes.style "font-weight" "500"
        , Html.Attributes.style "text-align" "center"
        , Html.Attributes.style "margin-bottom" "50px"
        , Html.Attributes.id branch.identifier
        ]
        [ viewLink [ Html.Attributes.href ( "#" ++ branch.identifier ) ] [ Html.text ( "#" ++ branch.name ) ] ]
    , Html.div [] ( viewPromotions branch )
    ]


viewBranches : List Branch -> List ( Html Message )
viewBranches branches =
  List.map viewBranch branches


viewBranchSummary : Branch -> Html Message
viewBranchSummary branch =
  Html.li
    [ Html.Attributes.style "font-family" "Roboto"
    , Html.Attributes.style "font-weight" "300"
    , Html.Attributes.style "list-style" "none"
    , Html.Attributes.style "margin-top" "10px"
    ]
    [ viewLink
        [ Html.Attributes.href ( "#" ++ branch.identifier ) ]
        [ Html.span [ Html.Attributes.style "color" "grey" ] [ Html.text "#" ]
        , Html.text branch.name
        ]
    ]


viewBranchesSummary : List Branch -> List (Html Message)
viewBranchesSummary branches =
    List.map viewBranchSummary branches


viewFooter : Html Message
viewFooter =
  Html.footer
    [ Html.Attributes.style "border-top" "0px solid lightgrey"
    , Html.Attributes.style "padding-top" "10px"
    , Html.Attributes.style "padding-bottom" "10px"
    , Html.Attributes.style "margin-top" "10px"
    , Html.Attributes.style "marigin-bottom" "10px"
    ]
    [ Html.small
      [ Html.Attributes.style "color" "grey"
      , Html.Attributes.style "font-family" "Gideon Roman"
      , Html.Attributes.style "font-weight" "100"
      , Html.Attributes.style "display" "block"
      , Html.Attributes.style "text-align" "center"
      ]
      [ Html.text "2022 © Amin NAIRI" ]
    ]


view : Model -> Html Message
view model = 
  Html.div
    [ Html.Attributes.style "margin-left" "auto"
    , Html.Attributes.style "margin-right" "auto"
    , Html.Attributes.style "max-width" "800px"
    ]
    [ Html.h1
        [ Html.Attributes.style "font-family" "Gideon Roman"
        , Html.Attributes.style "font-weight" "100"
        , Html.Attributes.style "text-align" "center"
        ]
        [ Html.text "ESGI Pré-requis" ]
    , viewButton
        [ Html.Attributes.style "margin-left" "0"
        , Html.Attributes.style "margin" "0 auto"
        , Html.Attributes.style "margin-bottom" "50px"
        , Html.Events.onClick ResetAllBranchesPromotionsRequirements
        , Html.Attributes.disabled (doesNotMeetBranchesPromotionsRequirements model.branches)
        , Html.Attributes.style "background-color" (if doesNotMeetBranchesPromotionsRequirements model.branches then "lightgrey" else "black")
        , Html.Attributes.style "color" (if doesNotMeetBranchesPromotionsRequirements model.branches then "grey" else "white")
        ]
        [ Html.text "Tout réinitialiser" ] 
    , Html.ul
        [ Html.Attributes.style "margin" "0"
        , Html.Attributes.style "padding" "0"
        ]
        (viewBranchesSummary model.branches)
    , Html.div [] ( viewBranches model.branches )
    , viewFooter
    ]


-- MAIN


main =
  Browser.element
    { init    = init
    , update  = update
    , view    = view
    , subscriptions = subscriptions
    }
