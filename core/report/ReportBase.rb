require "Prawn"

class ReportBase

#Definições do layout do arquivo
    PDF_OPTIONS = {
        :page_size   => "A4",
        :page_layout => :landscape,
        :margin      => [10, 20]
    }

    @@pdf = Prawn::Document.new(PDF_OPTIONS)

#Atributos da classe
#attr_acessor :tipoTeste

  def insereCabecalho
    @@pdf.text "EVIDÊNCIA DE TESTE WEB"
    @@pdf.move_down 10
  end

  def insereDadosSistemaOuAmbiente
    @@pdf.text Time.now.strftime("%d/%m/%Y %H:%M")
    @@pdf.text "Browser:"
    @@pdf.text "Versão:"
  end

  def insereDadosFuncionalidadeECenario
    @@pdf.move_down 20
    @@pdf.text "Funcionalidade:"
    @@pdf.move_down 10
    @@pdf.text "Cenário: "
    @@pdf.text "Criticidade:"
  end

  def inserePasso(passo)
    @@pdf.move_down 10
    @@pdf.text passo
  end

  def insereScript(script)
    @@pdf.text "Script: "
  end

  def insereImagePrint(image)
    @@pdf.move_down 5
    @@pdf.image(image,scale:0.30)
  end

  def insereStatus
    @@pdf.move_down 30
    @@pdf.text "TESTE APROVADO OU REPROVADO"
  end

  def inserelogsDaFalha
    @@pdf.move_down 20 
    @@pdf.text "Logs da falha"
  end

  def geraArquivoPDF
    @@pdf.render_file('C:\PAN\githubMarcone\AutomacaoTestesRuby\logs\Evidencia' + Time.now.strftime("%d_%m_%Y%H_%M_%S") + '.pdf')
  end

end