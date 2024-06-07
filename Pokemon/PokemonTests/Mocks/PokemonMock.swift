//
//  PokemonMock.swift
//  PokemonTests
//
//  Created by Nacho Mendez on 07/06/2024.
//

import Foundation
@testable import Pokemon

struct MockPokemon {
    static var pokemon =  PokemonModel(
        abilities: [
            Ability(
                ability: Species(name: "overgrow", url: "https://pokeapi.co/api/v2/ability/65/"),
                isHidden: false,
                slot: 1
            ),
            Ability(
                ability: Species(name: "chlorophyll", url: "https://pokeapi.co/api/v2/ability/34/"),
                isHidden: true,
                slot: 3
            )
        ],
        baseExperience: 64,
        cries: Cries(latest: "cry_latest.mp3", legacy: "cry_legacy.mp3"),
        forms: [
            Species(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon-form/1/")
        ],
        gameIndices: [
            GameIndex(gameIndex: 1, version: Species(name: "red", url: "https://pokeapi.co/api/v2/version/1/"))
        ],
        height: 7,
        heldItems: [],
        id: 1,
        isDefault: true,
        locationAreaEncounters: "https://pokeapi.co/api/v2/pokemon/1/encounters",
        moves: [
            Move(
                move: Species(name: "razor-wind", url: "https://pokeapi.co/api/v2/move/13/"),
                versionGroupDetails: [
                    VersionGroupDetail(
                        levelLearnedAt: 0,
                        moveLearnMethod: Species(name: "machine", url: "https://pokeapi.co/api/v2/move-learn-method/4/"),
                        versionGroup: Species(name: "red-blue", url: "https://pokeapi.co/api/v2/version-group/1/")
                    )
                ]
            )
        ],
        name: "bulbasaur",
        order: 1,
        pastAbilities: [],
        pastTypes: [],
        species: Species(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon-species/1/"),
        sprites: Sprites(
            backDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png",
            backFemale: nil,
            backShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/1.png",
            backShinyFemale: nil,
            frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
            frontFemale: nil,
            frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png",
            frontShinyFemale: nil,
            other: Other(
                dreamWorld: DreamWorld(
                    frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg",
                    frontFemale: nil
                ),
                home: Home(
                    frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png",
                    frontFemale: nil,
                    frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/1.png",
                    frontShinyFemale: nil
                ),
                officialArtwork: OfficialArtwork(
                    frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
                    frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/1.png"
                ),
                showdown: Sprites(
                    backDefault: "showdown_back_default.png",
                    backFemale: nil,
                    backShiny: "showdown_back_shiny.png",
                    backShinyFemale: nil,
                    frontDefault: "showdown_front_default.png",
                    frontFemale: nil,
                    frontShiny: "showdown_front_shiny.png",
                    frontShinyFemale: nil,
                    other: nil,
                    versions: nil,
                    animated: nil
                )
            ),
            versions: Versions(
                generationI: GenerationI(
                    redBlue: RedBlue(
                        backDefault: "red-blue_back_default.png",
                        backGray: "red-blue_back_gray.png",
                        backTransparent: "red-blue_back_transparent.png",
                        frontDefault: "red-blue_front_default.png",
                        frontGray: "red-blue_front_gray.png",
                        frontTransparent: "red-blue_front_transparent.png"
                    ),
                    yellow: RedBlue(
                        backDefault: "yellow_back_default.png",
                        backGray: "yellow_back_gray.png",
                        backTransparent: "yellow_back_transparent.png",
                        frontDefault: "yellow_front_default.png",
                        frontGray: "yellow_front_gray.png",
                        frontTransparent: "yellow_front_transparent.png"
                    )
                ),
                generationIi: GenerationIi(
                    crystal: Crystal(
                        backDefault: "crystal_back_default.png",
                        backShiny: "crystal_back_shiny.png",
                        backShinyTransparent: "crystal_back_shiny_transparent.png",
                        backTransparent: "crystal_back_transparent.png",
                        frontDefault: "crystal_front_default.png",
                        frontShiny: "crystal_front_shiny.png",
                        frontShinyTransparent: "crystal_front_shiny_transparent.png",
                        frontTransparent: "crystal_front_transparent.png"
                    ),
                    gold: Gold(
                        backDefault: "gold_back_default.png",
                        backShiny: "gold_back_shiny.png",
                        frontDefault: "gold_front_default.png",
                        frontShiny: "gold_front_shiny.png",
                        frontTransparent: "gold_front_transparent.png"
                    ),
                    silver: Gold(
                        backDefault: "silver_back_default.png",
                        backShiny: "silver_back_shiny.png",
                        frontDefault: "silver_front_default.png",
                        frontShiny: "silver_front_shiny.png",
                        frontTransparent: "silver_front_transparent.png"
                    )
                ),
                generationIii: GenerationIii(
                    emerald: OfficialArtwork(
                        frontDefault: "emerald_front_default.png",
                        frontShiny: "emerald_front_shiny.png"
                    ),
                    fireredLeafgreen: Gold(
                        backDefault: "firered_leafgreen_back_default.png",
                        backShiny: "firered_leafgreen_back_shiny.png",
                        frontDefault: "firered_leafgreen_front_default.png",
                        frontShiny: "firered_leafgreen_front_shiny.png",
                        frontTransparent: nil
                    ),
                    rubySapphire: Gold(
                        backDefault: "ruby_sapphire_back_default.png",
                        backShiny: "ruby_sapphire_back_shiny.png",
                        frontDefault: "ruby_sapphire_front_default.png",
                        frontShiny: "ruby_sapphire_front_shiny.png",
                        frontTransparent: nil
                    )
                ),
                generationIv: GenerationIv(
                    diamondPearl: Sprites(
                        backDefault: "diamond_pearl_back_default.png",
                        backFemale: nil,
                        backShiny: "diamond_pearl_back_shiny.png",
                        backShinyFemale: nil,
                        frontDefault: "diamond_pearl_front_default.png",
                        frontFemale: nil,
                        frontShiny: "diamond_pearl_front_shiny.png",
                        frontShinyFemale: nil,
                        other: nil,
                        versions: nil,
                        animated: nil
                    ),
                    heartgoldSoulsilver: Sprites(
                        backDefault: "heartgold_soulsilver_back_default.png",
                        backFemale: nil,
                        backShiny: "heartgold_soulsilver_back_shiny.png",
                        backShinyFemale: nil,
                        frontDefault: "heartgold_soulsilver_front_default.png",
                        frontFemale: nil,
                        frontShiny: "heartgold_soulsilver_front_shiny.png",
                        frontShinyFemale: nil,
                        other: nil,
                        versions: nil,
                        animated: nil
                    ),
                    platinum: Sprites(
                        backDefault: "platinum_back_default.png",
                        backFemale: nil,
                        backShiny: "platinum_back_shiny.png",
                        backShinyFemale: nil,
                        frontDefault: "platinum_front_default.png",
                        frontFemale: nil,
                        frontShiny: "platinum_front_shiny.png",
                        frontShinyFemale: nil,
                        other: nil,
                        versions: nil,
                        animated: nil
                    )
                ),
                generationV: GenerationV(
                    blackWhite: Sprites(
                        backDefault: "black_white_back_default.png",
                        backFemale: nil,
                        backShiny: "black_white_back_shiny.png",
                        backShinyFemale: nil,
                        frontDefault: "black_white_front_default.png",
                        frontFemale: nil,
                        frontShiny: "black_white_front_shiny.png",
                        frontShinyFemale: nil,
                        other: nil,
                        versions: nil,
                        animated: nil
                    )
                ),
                generationVi: [
                    "omegaruby-alphasapphire": Home(
                        frontDefault: "omegaruby_alphasapphire_front_default.png",
                        frontFemale: nil,
                        frontShiny: "omegaruby_alphasapphire_front_shiny.png",
                        frontShinyFemale: nil
                    ),
                    "x-y": Home(
                        frontDefault: "x_y_front_default.png",
                        frontFemale: nil,
                        frontShiny: "x_y_front_shiny.png",
                        frontShinyFemale: nil
                    )
                ],
                generationVii: GenerationVii(
                    icons: DreamWorld(
                        frontDefault: "icons_front_default.png",
                        frontFemale: nil
                    ),
                    ultraSunUltraMoon: Home(
                        frontDefault: "ultrasun_ultramoon_front_default.png",
                        frontFemale: nil,
                        frontShiny: "ultrasun_ultramoon_front_shiny.png",
                        frontShinyFemale: nil
                    )
                ),
                generationViii: GenerationViii(
                    icons: DreamWorld(
                        frontDefault: "icons_front_default.png",
                        frontFemale: nil
                    )
                )
            ),
            animated: Sprites(
                backDefault: "animated_back_default.png",
                backFemale: nil,
                backShiny: "animated_back_shiny.png",
                backShinyFemale: nil,
                frontDefault: "animated_front_default.png",
                frontFemale: nil,
                frontShiny: "animated_front_shiny.png",
                frontShinyFemale: nil,
                other: nil,
                versions: nil,
                animated: nil
            )
        ),
        stats: [
            Stat(
                baseStat: 45,
                effort: 0,
                stat: Species(name: "hp", url: "https://pokeapi.co/api/v2/stat/1/")
            ),
            Stat(
                baseStat: 49,
                effort: 0,
                stat: Species(name: "attack", url: "https://pokeapi.co/api/v2/stat/2/")
            )
        ],
        types: [
            TypeElement(
                slot: 1,
                type: Species(name: "grass", url: "https://pokeapi.co/api/v2/type/12/")
            ),
            TypeElement(
                slot: 2,
                type: Species(name: "poison", url: "https://pokeapi.co/api/v2/type/4/")
            )
        ],
        weight: 69
    )
}
