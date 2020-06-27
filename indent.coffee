places = [
  name: "Nuevo Progreso"
  population: 2_704
,
  name: "San Marcos"
  population: 47_063
,
  name: "Xela"
  population: 180_706
]

categorizedPlaces = places.map (place) ->
  name: place.name
# Hi there!
  category: (
    population = place.population
    if population < 5_000 then "village"
    else if population < 100_000
      category = "town"
      category
    else "city"
  )
console.log categorizedPlaces

# console.log [1, 2, 3].reduce(
#   ((x, y) ->
#     x + y),
#   0,
# )

# See also: https://openjdk.java.net/jeps/355
console.log \
  """
  - name: Nuevo Progreso
    population: 2704
  - name: San Marcos
    population: 47063
  - name: Xela
    population: 180706
  """
