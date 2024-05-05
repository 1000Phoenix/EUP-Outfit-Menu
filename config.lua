config = {
    menuPosition = "right",
    enableOpenCommand = true,
    openCommand = "eup",
    enableAccessCircles = true,
    accessCircles = {
        {x = 448.0, y = 6008.4, z = 30.71}, -- Paleto PD
        {x = 1849.10, y = 3689.49, z = 33.26}, -- Sandy PD
        {x = 454.4, y = -989.1, z = 29.68} -- Mission Code PD
    },
    organizationsOrder = {"Police", "NHS"},
    organizations = {
        Police = {
            extraCategories = {
                Taser = "taserComponents",
                Firearms = "firearmsComponents"
                AlternateHat = "alternatehatProps"
            },
            departments = {
                {
                    department = "Response Policing",
                    subMenus = {
                        {
                            subMenu = "Male | Ped Presets",
                            outfits = {
                                {
                                    button = "Lancs Uniform",
                                    model = "mp_m_freemode_01",
                                    ranks = {
                                        {
                                            button = "Constable",
                                            model = "mp_m_freemode_01",
                                            props = {
                                                {0, 224, 0}, -- Hats
                                                {1, 0, 0}, -- Glasses
                                                {6, 0, 0} -- Watch
                                            },
                                            components = {
                                                {1, 0, 0}, -- Mask
                                                {3, 0, 0}, -- Upper body
                                                {4, 193, 0}, -- Legs / Pants
                                                {5, 0, 0}, -- Bags / Parachutes
                                                {6, 24, 0}, -- Shoes
                                                {7, 0, 0}, -- Neck / Scarfs
                                                {8, 219, 0}, -- Shirt / Accessory
                                                {9, 62, 0}, -- Body Armor
                                                {10, 0, 0}, -- Badges / Logos
                                                {11, 524, 0} -- Jackets
                                            },
                                            taserComponents = {
                                                {9, 64, 0} -- Body Armor
                                            },
                                            firearmsComponents = {
                                                {7, 178, 0} -- Neck / Scarfs
                                            }
                                        },
                                        {
                                            button = "Sergeant",
                                            model = "mp_m_freemode_01",
                                            props = {
                                                {0, 224, 0}, -- Hats
                                                {1, 0, 0}, -- Glasses
                                                {6, 0, 0} -- Watch
                                            },
                                            components = {
                                                {1, 0, 0}, -- Mask
                                                {3, 0, 0}, -- Upper body
                                                {4, 193, 0}, -- Legs / Pants
                                                {5, 0, 0}, -- Bags / Parachutes
                                                {6, 24, 0}, -- Shoes
                                                {7, 0, 0}, -- Neck / Scarfs
                                                {8, 219, 0}, -- Shirt / Accessory
                                                {9, 62, 1}, -- Body Armor
                                                {10, 0, 0}, -- Badges / Logos
                                                {11, 524, 1} -- Jackets
                                            },
                                            taserComponents = {
                                                {9, 64, 1} -- Body Armor
                                            },
                                            firearmsComponents = {
                                                {7, 178, 0} -- Neck / Scarfs
                                            }
                                        },
                                        {
                                            button = "Inspector",
                                            model = "mp_m_freemode_01",
                                            props = {
                                                {0, 225, 0}, -- Hats
                                                {1, 0, 0}, -- Glasses
                                                {6, 0, 0} -- Watch
                                            },
                                            components = {
                                                {1, 0, 0}, -- Mask
                                                {3, 0, 0}, -- Upper body
                                                {4, 193, 0}, -- Legs / Pants
                                                {5, 0, 0}, -- Bags / Parachutes
                                                {6, 24, 0}, -- Shoes
                                                {7, 0, 0}, -- Neck / Scarfs
                                                {8, 219, 0}, -- Shirt / Accessory
                                                {9, 62, 2}, -- Body Armor
                                                {10, 0, 0}, -- Badges / Logos
                                                {11, 524, 2} -- Jackets
                                            },
                                            taserComponents = {
                                                {9, 64, 2} -- Body Armor
                                            },
                                            firearmsComponents = {
                                                {7, 178, 0} -- Neck / Scarfs
                                            }
                                        }
                                    }
                                }
                            }
                        },
                        {
                            subMenu = "Female | Ped Presets",
                            outfits = {
                                {
                                    button = "Patrol Class A Uniform",
                                    model = "mp_f_freemode_01",
                                    ranks = {
                                        {
                                            button = "Constable",
                                            model = "mp_f_freemode_01",
                                            props = {
                                                {0, 2, 0}, -- Hats
                                                {1, 0, 0}, -- Glasses
                                                {6, 0, 0} -- Watch
                                            },
                                            components = {
                                                {1, 0, 0}, -- Mask
                                                {3, 0, 0}, -- Upper body
                                                {4, 71, 0}, -- Legs / Pants
                                                {5, 0, 0}, -- Bags / Parachutes
                                                {6, 24, 0}, -- Shoes
                                                {7, 0, 0}, -- Neck / Scarfs
                                                {8, 13, 0}, -- Shirt / Accessory
                                                {9, 35, 0}, -- Body Armor
                                                {10, 0, 0}, -- Badges / Logos
                                                {11, 298, 0} -- Jackets
                                            }
                                        },
                                        {
                                            button = "Sergeant",
                                            model = "mp_f_freemode_01",
                                            props = {
                                                {0, 2, 0}, -- Hats
                                                {1, 0, 0}, -- Glasses
                                                {6, 0, 0} -- Watch
                                            },
                                            components = {
                                                {1, 0, 0}, -- Mask
                                                {3, 0, 0}, -- Upper body
                                                {4, 71, 0}, -- Legs / Pants
                                                {5, 0, 0}, -- Bags / Parachutes
                                                {6, 24, 0}, -- Shoes
                                                {7, 0, 0}, -- Neck / Scarfs
                                                {8, 13, 0}, -- Shirt / Accessory
                                                {9, 35, 1}, -- Body Armor
                                                {10, 0, 0}, -- Badges / Logos
                                                {11, 298, 1} -- Jackets
                                            }
                                        },
                                        {
                                            button = "Inspector",
                                            model = "mp_f_freemode_01",
                                            props = {
                                                {0, 4, 0}, -- Hats
                                                {1, 0, 0}, -- Glasses
                                                {6, 0, 0} -- Watch
                                            },
                                            components = {
                                                {1, 0, 0}, -- Mask
                                                {3, 0, 0}, -- Upper body
                                                {4, 71, 0}, -- Legs / Pants
                                                {5, 0, 0}, -- Bags / Parachutes
                                                {6, 24, 0}, -- Shoes
                                                {7, 0, 0}, -- Neck / Scarfs
                                                {8, 13, 0}, -- Shirt / Accessory
                                                {9, 35, 2}, -- Body Armor
                                                {10, 0, 0}, -- Badges / Logos
                                                {11, 298, 2} -- Jackets
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                },
                {
                    department = "Traffic Policing",
                    subMenus = {
                        {
                            subMenu = "Male | Ped Presets",
                            outfits = {
                                {
                                    button = "Lancs Traffic Uniform",
                                    model = "mp_m_freemode_01",
                                    ranks = {
                                        {
                                            button = "Constable",
                                            model = "mp_m_freemode_01",
                                            props = {
                                                {0, 228, 0}, -- Hats
                                                {1, 0, 0}, -- Glasses
                                                {6, 0, 0} -- Watch
                                            },
                                            components = {
                                                {1, 0, 0}, -- Mask
                                                {3, 0, 0}, -- Upper body
                                                {4, 193, 0}, -- Legs / Pants
                                                {5, 0, 0}, -- Bags / Parachutes
                                                {6, 24, 0}, -- Shoes
                                                {7, 0, 0}, -- Neck / Scarfs
                                                {8, 221, 0}, -- Shirt / Accessory
                                                {9, 67, 0}, -- Body Armor
                                                {10, 0, 0}, -- Badges / Logos
                                                {11, 524, 0} -- Jackets
                                            },
                                            taserComponents = {
                                                {9, 68, 0} -- Body Armor
                                            },
                                            firearmsComponents = {
                                                {7, 178, 0} -- Neck / Scarfs
                                            }
                                        },
                                        {
                                            button = "Sergeant",
                                            model = "mp_m_freemode_01",
                                            props = {
                                                {0, 228, 0}, -- Hats
                                                {1, 0, 0}, -- Glasses
                                                {6, 0, 0} -- Watch
                                            },
                                            components = {
                                                {1, 0, 0}, -- Mask
                                                {3, 0, 0}, -- Upper body
                                                {4, 193, 0}, -- Legs / Pants
                                                {5, 0, 0}, -- Bags / Parachutes
                                                {6, 24, 0}, -- Shoes
                                                {7, 0, 0}, -- Neck / Scarfs
                                                {8, 221, 1}, -- Shirt / Accessory
                                                {9, 67, 1}, -- Body Armor
                                                {10, 0, 0}, -- Badges / Logos
                                                {11, 524, 1} -- Jackets
                                            },
                                            taserComponents = {
                                                {9, 68, 1} -- Body Armor
                                            },
                                            firearmsComponents = {
                                                {7, 178, 0} -- Neck / Scarfs
                                            }
                                        },
                                        {
                                            button = "Inspector",
                                            model = "mp_m_freemode_01",
                                            props = {
                                                {0, 229, 0}, -- Hats
                                                {1, 0, 0}, -- Glasses
                                                {6, 0, 0} -- Watch
                                            },
                                            components = {
                                                {1, 0, 0}, -- Mask
                                                {3, 0, 0}, -- Upper body
                                                {4, 193, 0}, -- Legs / Pants
                                                {5, 0, 0}, -- Bags / Parachutes
                                                {6, 24, 0}, -- Shoes
                                                {7, 0, 0}, -- Neck / Scarfs
                                                {8, 221, 2}, -- Shirt / Accessory
                                                {9, 67, 2}, -- Body Armor
                                                {10, 0, 0}, -- Badges / Logos
                                                {11, 524, 2} -- Jackets
                                            },
                                            taserComponents = {
                                                {9, 68, 2} -- Body Armor
                                            },
                                            firearmsComponents = {
                                                {7, 178, 0} -- Neck / Scarfs
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        },
        NHS = {
            departments = {
                {
                    department = "Paramedic",
                    subMenus = {
                        {
                            subMenu = "Male | Ped Presets",
                            outfits = {
                                {
                                    button = "Shift Uniform",
                                    model = "mp_m_freemode_01",
                                    ranks = {
                                        {
                                            button = "Student Paramedic",
                                            model = "mp_m_freemode_01",
                                            props = {
                                                {0, 2, 0}, -- Hats
                                                {1, 0, 0}, -- Glasses
                                                {6, 0, 0} -- Watch
                                            },
                                            components = {
                                                {1, 0, 0}, -- Mask
                                                {3, 0, 0}, -- Upper body
                                                {4, 71, 0}, -- Legs / Pants
                                                {5, 0, 0}, -- Bags / Parachutes
                                                {6, 24, 0}, -- Shoes
                                                {7, 0, 0}, -- Neck / Scarfs
                                                {8, 13, 0}, -- Shirt / Accessory
                                                {9, 34, 0}, -- Body Armor
                                                {10, 0, 0}, -- Badges / Logos
                                                {11, 298, 0} -- Jackets
                                            },
                                            taserComponents = {
                                                {9, 35, 0} -- Body Armor
                                            },
                                            firearmsComponents = {
                                                {7, 62, 0} -- Neck / Scarfs
                                            }
                                        },
                                        {
                                            button = "Paramedic",
                                            model = "mp_m_freemode_01",
                                            props = {
                                                {0, 2, 0}, -- Hats
                                                {1, 0, 0}, -- Glasses
                                                {6, 0, 0} -- Watch
                                            },
                                            components = {
                                                {1, 0, 0}, -- Mask
                                                {3, 0, 0}, -- Upper body
                                                {4, 71, 0}, -- Legs / Pants
                                                {5, 0, 0}, -- Bags / Parachutes
                                                {6, 24, 0}, -- Shoes
                                                {7, 0, 0}, -- Neck / Scarfs
                                                {8, 13, 0}, -- Shirt / Accessory
                                                {9, 35, 1}, -- Body Armor
                                                {10, 0, 0}, -- Badges / Logos
                                                {11, 298, 1} -- Jackets
                                            }
                                        },
                                        {
                                            button = "Advanced Paramedic",
                                            model = "mp_m_freemode_01",
                                            props = {
                                                {0, 4, 0}, -- Hats
                                                {1, 0, 0}, -- Glasses
                                                {6, 0, 0} -- Watch
                                            },
                                            components = {
                                                {1, 0, 0}, -- Mask
                                                {3, 0, 0}, -- Upper body
                                                {4, 71, 0}, -- Legs / Pants
                                                {5, 0, 0}, -- Bags / Parachutes
                                                {6, 24, 0}, -- Shoes
                                                {7, 0, 0}, -- Neck / Scarfs
                                                {8, 13, 0}, -- Shirt / Accessory
                                                {9, 35, 2}, -- Body Armor
                                                {10, 0, 0}, -- Badges / Logos
                                                {11, 298, 2} -- Jackets
                                            }
                                        }
                                    }
                                },
                                {
                                    button = "Formal Uniform",
                                    model = "mp_m_freemode_01",
                                    ranks = {
                                        {
                                            button = "Student Paramedic",
                                            model = "mp_m_freemode_01",
                                            props = {
                                                {0, 2, 0}, -- Hats
                                                {1, 0, 0}, -- Glasses
                                                {6, 0, 0} -- Watch
                                            },
                                            components = {
                                                {1, 0, 0}, -- Mask
                                                {3, 0, 0}, -- Upper body
                                                {4, 71, 0}, -- Legs / Pants
                                                {5, 0, 0}, -- Bags / Parachutes
                                                {6, 24, 0}, -- Shoes
                                                {7, 0, 0}, -- Neck / Scarfs
                                                {8, 7, 1}, -- Shirt / Accessory
                                                {9, 0, 0}, -- Body Armor
                                                {10, 0, 0}, -- Badges / Logos
                                                {11, 300, 0} -- Jackets
                                            }
                                        },
                                        {
                                            button = "Paramedic",
                                            model = "mp_m_freemode_01",
                                            props = {
                                                {0, 2, 0}, -- Hats
                                                {1, 0, 0}, -- Glasses
                                                {6, 0, 0} -- Watch
                                            },
                                            components = {
                                                {1, 0, 0}, -- Mask
                                                {3, 0, 0}, -- Upper body
                                                {4, 71, 0}, -- Legs / Pants
                                                {5, 0, 0}, -- Bags / Parachutes
                                                {6, 24, 0}, -- Shoes
                                                {7, 0, 0}, -- Neck / Scarfs
                                                {8, 7, 3}, -- Shirt / Accessory
                                                {9, 0, 0}, -- Body Armor
                                                {10, 0, 0}, -- Badges / Logos
                                                {11, 300, 1} -- Jackets
                                            }
                                        },
                                        {
                                            button = "Advanced Paramedic",
                                            model = "mp_m_freemode_01",
                                            props = {
                                                {0, 3, 0}, -- Hats
                                                {1, 0, 0}, -- Glasses
                                                {6, 0, 0} -- Watch
                                            },
                                            components = {
                                                {1, 0, 0}, -- Mask
                                                {3, 0, 0}, -- Upper body
                                                {4, 71, 0}, -- Legs / Pants
                                                {5, 0, 0}, -- Bags / Parachutes
                                                {6, 24, 0}, -- Shoes
                                                {7, 0, 0}, -- Neck / Scarfs
                                                {8, 7, 5}, -- Shirt / Accessory
                                                {9, 0, 0}, -- Body Armor
                                                {10, 0, 0}, -- Badges / Logos
                                                {11, 300, 2} -- Jackets
                                            }
                                        }
                                    }
                                }
                            }
                        },
                        {
                            subMenu = "Female | Ped Presets",
                            outfits = {
                                {
                                    button = "Shift Uniform",
                                    model = "mp_f_freemode_01",
                                    ranks = {
                                        {
                                            button = "Student Paramedic",
                                            model = "mp_f_freemode_01",
                                            props = {
                                                {0, 2, 0}, -- Hats
                                                {1, 0, 0}, -- Glasses
                                                {6, 0, 0} -- Watch
                                            },
                                            components = {
                                                {1, 0, 0}, -- Mask
                                                {3, 0, 0}, -- Upper body
                                                {4, 71, 0}, -- Legs / Pants
                                                {5, 0, 0}, -- Bags / Parachutes
                                                {6, 24, 0}, -- Shoes
                                                {7, 0, 0}, -- Neck / Scarfs
                                                {8, 13, 0}, -- Shirt / Accessory
                                                {9, 35, 0}, -- Body Armor
                                                {10, 0, 0}, -- Badges / Logos
                                                {11, 298, 0} -- Jackets
                                            }
                                        },
                                        {
                                            button = "Paramedic",
                                            model = "mp_f_freemode_01",
                                            props = {
                                                {0, 2, 0}, -- Hats
                                                {1, 0, 0}, -- Glasses
                                                {6, 0, 0} -- Watch
                                            },
                                            components = {
                                                {1, 0, 0}, -- Mask
                                                {3, 0, 0}, -- Upper body
                                                {4, 71, 0}, -- Legs / Pants
                                                {5, 0, 0}, -- Bags / Parachutes
                                                {6, 24, 0}, -- Shoes
                                                {7, 0, 0}, -- Neck / Scarfs
                                                {8, 13, 0}, -- Shirt / Accessory
                                                {9, 35, 1}, -- Body Armor
                                                {10, 0, 0}, -- Badges / Logos
                                                {11, 298, 1} -- Jackets
                                            }
                                        },
                                        {
                                            button = "Advanced Paramedic",
                                            model = "mp_f_freemode_01",
                                            props = {
                                                {0, 4, 0}, -- Hats
                                                {1, 0, 0}, -- Glasses
                                                {6, 0, 0} -- Watch
                                            },
                                            components = {
                                                {1, 0, 0}, -- Mask
                                                {3, 0, 0}, -- Upper body
                                                {4, 71, 0}, -- Legs / Pants
                                                {5, 0, 0}, -- Bags / Parachutes
                                                {6, 24, 0}, -- Shoes
                                                {7, 0, 0}, -- Neck / Scarfs
                                                {8, 13, 0}, -- Shirt / Accessory
                                                {9, 35, 2}, -- Body Armor
                                                {10, 0, 0}, -- Badges / Logos
                                                {11, 298, 2} -- Jackets
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}