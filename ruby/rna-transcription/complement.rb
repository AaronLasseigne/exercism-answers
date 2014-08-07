class Complement
  DNA = 'GCTA'.freeze
  RNA = 'CGAU'.freeze
  private_constant :DNA, :RNA

  class << self
    def of_dna(strand)
      strand.tr(DNA, RNA)
    end

    def of_rna(strand)
      strand.tr(RNA, DNA)
    end
  end
end
