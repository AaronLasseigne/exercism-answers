defmodule DNA do
  @uracil    'U'
  @thymidine 'T'

  def to_rna(chain) do
    Regex.replace(%r/#{@thymidine}/, chain, @uracil)
  end
end
