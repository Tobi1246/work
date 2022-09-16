module Company_Maker

  attr_reader :name_company

  def name_company(name_company)
    @name_company = name_company 
    puts "Компания-производитель #{name_company}"
  end

end
