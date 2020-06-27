open System
open System.Text.RegularExpressions

type Place = {
    Name: string
    Population: int
}

type Categorized = {
    Name: string
    Category: string
}

let private dedent (str: string) =
    Regex.Replace(
        str.Trim(), @"^\s*\|", String.Empty,
        RegexOptions.Multiline
    )

[<EntryPoint>]
let main argv =
    let places = [
        {
            Name = "Nuevo Progreso"
            Population = 2_704
        }
        { Name = "San Marcos"; Population = 47_063 }
        { Name = "Xela"; Population = 180_706 }
    ]
// Hi there!
    let categorizedPlaces =
        List.map
            (fun place ->
                let population = place.Population
                {
                    Name = place.Name
                    Category =
                        if population < 5_000 then "village"
                        elif population < 100_000 then
                            let category = "town"
                            category
                        else "city"
                }
            )
            places
    printfn "%A" categorizedPlaces

    printfn "%s" (dedent
        """
        |- name: Nuevo Progreso
        |  population: 2704
        |- name: San Marcos
        |  population: 47063
        |- name: Xela
        |  population: 180706
        """
    )

    0
