from dataclasses import dataclass
from pprint import pprint
from textwrap import dedent


@dataclass
class Place:
    name: str
    population: int


@dataclass
class Categorized:
    name: str
    category: str


def main():
    def categorize(place: Place) -> str:
        population = place.population
        # Branch on population.
        if population < 5_000:
            category = "village"
        elif population < 100_000:
            category = "town"
        else:
            category = "city"
        # Build result.
        return Categorized(
            name=place.name, category=category
        )

    places = [
        Place(name="Nuevo Progreso", population=2_704),
        Place(name="San Marcos", population=47_063),
        Place(name="Xela", population=180_706),
    ]

    # categorized_places = [*map(categorize, places)]
    # categorized_places = [
    #     categorize(place) for place in places
    # ]
    categorized_places = [
        *map(
            lambda place: Categorized(
                name=place.name,
                category=(
                    "village" if place.population < 5_000
                    else "town" if place.population < 100_000
                    else "city"
                ),
            ),
            places,
        )
    ]
    pprint(categorized_places)

# Hi there!
    # print(
    #     # dedent(
    #         """
    #         - name: Nuevo Progreso
    #           population: 2704
    #         - name: San Marcos
    #           population: 47063
    #         - name: Xela
    #           population: 180706
    #         """
    #     # ).strip()
    # )


if __name__ == "__main__":
    main()


# https://www.artima.com/weblogs/viewpost.jsp?thread=147358
