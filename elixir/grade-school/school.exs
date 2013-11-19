defmodule School do
  def add(db, name, grade) do
    Dict.update(db, grade, [name], &(&1 ++ [name]))
  end

  def grade(db, grade) do
    Dict.get(db, grade, [])
  end

  def sort(db) do
    Dict.merge db, db, fn(_grade, roster, _roster2) ->
      Enum.sort(roster)
    end
  end
end
