import sequtils

type
  Place = object
    name: string
    population: int

  Categorized = object
    name: string
    category: string

proc main() =
  let places = [
    Place(
      name: "Nuevo Progreso",
      population: 2_704,
    ),
    Place(name: "San Marcos", population: 47_063),
    Place(name: "Xela", population: 180_706),
  ]
# Hi there!
  let categorizedPlaces = places.map(
    func (place: Place): Categorized =
      let population = place.population
      return Categorized(
        name: place.name,
        category:
          if population < 5_000: "village"
          elif population < 100_000:
            let category = "town"
            category
          else: "city",
      ),
  )
  echo categorizedPlaces

  let yaml =
    "- name: Nuevo Progreso\n" &
    "  population: 2704\n" &
    "- name: San Marcos\n" &
    "  population: 47063\n" &
    "- name: Xela\n" &
    "  population: 180706"
  echo yaml

main()
