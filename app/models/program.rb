class Program < ApplicationRecord

  def barebones_title
    title.sub(", #{degree_type}",'').sub(' Minor','').sub(' Graduate Certificate','').sub(' Undergraduate Certificate','')
  end

  def interpreted_degree
    case degree_type
    when ''
      then 'Minor'
    when 'CERG'
      then 'Graduate Certificate'
    when 'CERB'
      then 'Undergraduate Certificate'
    else
      degree_type
    end
  end
end
