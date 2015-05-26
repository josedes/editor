class PagesDynamicController < ApplicationController
def show2
    @page = MenuNivel0.find(params[:id])
    puts "IMPRIMIR PAGE"
    puts @page
    #@opcionesMenuPrincipal = MenuNivel0.all
    redirect_to not_found_path unless @page
  end


def show
	# Works with nested subfolders
	template = File.join(params[:controller], "show")
	puts "TEMPLATE"
	puts template
	puts params[:controller]
	puts params[:page]
	puts "TEMPLATE"
	@opcionesMenuPrincipal = MenuNivel0.all
	render template
	rescue ActionView::MissingTemplate => e
	if e.message =~ %r{Missing template #{template}}
		raise ActionController::RoutingError, 'Not Found'
	else
		raise e
	end
end

end