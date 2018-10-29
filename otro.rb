def limpiar
    system('clear')
end
@numero_de_autores=0
def registro_de_nuevos_libros(cola,the_isbn,nombre_libro,nombre_autor,precio_libro,existencias_libro)
    #Esta funcion es para ingresar diferente ejemplares en la libreria, son ordenados por autor y cada libro
    #por lo menos tiene los siguientes datos: ISBN, nombre,autor y precio.
    #Se debe tomar en cuenta el numero de existencia basados en el ISBN, no en el nombre del autor o del libro
    #En caso de que se ingrese un nuevo autor, se debe iniciar una pila nueva
    #Los libros se almacenana en diferentes pilas referido a nombre de libro , pero misma pila referido al nombre del autor
    limpiar
    #piladelibros={
    #    topeL:nil,
    #    maxL:-1,
    #    vaciaL: true,
    #    llenaL: false,
    #    tamañoL:0
    #}
    
    libros={
        isbn: the_isbn,
        nombre_del_libro: nombre_libro,
        nombre_del_autor: nombre_autor,
        precio_del_libro: precio_libro,
        existencias_del_libro: existencias_libro,
        siguienteL:nil
    }

  #
  if cola[:esta_vacia] == true
    puts "Error, deben existir autores para ingresar libros"
  elsif
      #Recorremos la pila hasta obtener el autor al que debemos asociar el libro
      elemento = cola[:fondo]
      
      while elemento != nil
       puts elemento[:nombre]
       puts "aqui"
        if elemento[:nombre] == nombre_autor 
          pilaaux = elemento[:lapila]
          if pilaaux == nil
              piladelibros={
              topeL:libros,
              maxL:-1,
              vaciaL: true,
              llenaL: false,
              tamañoL:1
              }
              elemento[:lapila] = piladelibros
              break
          elsif
              auxb = pilaaux[:topel]
              bandera = false
              while auxb != nil
                if auxb[:isbn] == the_isbn
                  auxb[:existencias_del_libro] = auxb[:existencias_del_libro] + existencias_libro
                  bandera = true
                  break
                end
                auxb = auxb[:siguiente]
              end
              if bandera == false
                libros[:siguienteL] = pilaaux[:topeL]
                pilaaux[:topeL] = libros
              end
              break
          end
      end    
      elemento = elemento[:siguiente]
      end
  end
end


def registrosautores(cola)
  #El sistema debe utilizar una cola con un maximo de 5 autores, para cada autor se almecenara la pila de libros
  #no se puede almacenar dos veces a un mismo autor
  limpiar
print 'Inserte el Nombre del Autor: '
#el nombre del autor se ingresa en la varible llamada nom
nom = gets.chomp.upcase
#se crea el diccionario de autores donde los datos seran: nombre y siguiente
autores = {
    nombre: nom,
    lapila: nil,
    siguiente: nil
}
#hay que guardar por posicion
#Se crea una condicion para verificar si esta vacia, tope, fondo y tamaño
cola[:tamaño]=@numero_de_autores
if cola[:esta_vacia] == true
  cola[:tope] = autores
  cola[:fondo] = autores
  cola[:esta_vacia] = false
  cola[:tamaño] = cola[:tamaño] +1
  @numero_de_autores=@numero_de_autores+1
else
    
if cola[:tamaño] < cola[:max] 
 if  cola[:fondo][:nombre]==autores[:nombre]
    puts 'ESE AUTOR YA FUE INGRESADO ANTES'
elsif cola[:fondo][:nombre]!=autores[:nombre] && cola[:fondo][:siguiente]==nil
  autores[:siguiente] = autores
  autores[:siguiente] = cola[:fondo]
  cola[:fondo] = autores
  cola[:tamaño] = cola[:tamaño] +1
  @numero_de_autores=@numero_de_autores+1
#puts "cola #{cola[:fondo]}"
else
boo = false
if boo==false
  elemento = cola[:fondo]
 begin
    nuevo_elemento = elemento[:siguiente]
    if nuevo_elemento[:nombre]==autores[:nombre]
        puts 'ESE AUTOR YA FUE INGRESADO ANTES'
    boo=false
    else
        boo= true
    end
    nuevo_elemento [:valor]
    elemento = nuevo_elemento
    end while elemento[:siguiente] != nil
    gets
end
if boo==true
    puts autores[:siguiente] = autores
    puts autores[:siguiente] = cola[:fondo]
    puts cola[:fondo] = autores
    puts cola[:tamaño] = cola[:tamaño] +1
    @numero_de_autores=@numero_de_autores+1
   puts "cola #{cola[:fondo]}"
end
 end
else
  puts 'COLA LLENA'
  puts 'YA TIENE LOS 5 AUTORES SOLICIDADOS'
end
end
end

def listado_de_libros()
    #Esta opcion debe mostrar todos los libros en un sistema independiente del autor
    #No se debe repetir ISBN, se de incrementar en un contador y mostrar el total de datos
    #Se debe mostrar el listado de libros con los siguientes datos: ISBN , nombre, precio , autor y existencias
    #en lugar de repetir el libro mostrar las existencias, debe mantenr el orden en las diferentes pilas de libros
    #en caso de que no existan libros en el sistema debe aparecer una alertas
    
    #if variable=> 0
     # puts ''
    #else
     # puts 'NO HAY LIBROS EN EL SISTEMA '
    #end
end

def listadoautores(cola)
    #Debe mostrar la capacidad de libros que tiene dicho autor
    #El orden de la cola de autores debe ser respetada
    #En caso de no existir autores en el sistema debe aparecer una alerta informando
    limpiar
    if cola[:esta_vacia]==true
        puts "no hay datos"
    else
    elemento = cola[:fondo]
    while elemento != nil
    puts elemento[:nombre]
    elemento = elemento[:siguiente]
    end
    gets
    end
end

def listadoautores2(cola)
    #Debe mostrar la capacidad de libros que tiene dicho autor
    #El orden de la cola de autores debe ser respetada
    #En caso de no existir autores en el sistema debe aparecer una alerta informando
    limpiar
    if    cola[:esta_vacia]==true
        puts "no hay datos"
    else
    elemento = cola[:fondo]
    while elemento != nil
    puts elemento[:nombre]
      aux = elemento[:lapila][:topeL]
      while aux != nil
        puts aux[:nombre_libro]
        aux = aux[:siguienteL]
      end
    
    elemento = elemento[:siguiente]
    end
    gets
    end
end


def buscar_libro()
   #Se ingresara el ISBN y este debe mostrar cuantas existencias tiene este libro
   #Debe mostrar los siguientes datos: ISBN, nombre ,autor , precio y existencias
   #Si el usuario ingresa un ISBN invalido debe informarle al vendedor
   puts 'INGRESE EL ISBN QUE DESEA BUSCAR '
  libroi= gets.to_i
  if libroi ==
    puts
  else
    puts 'EL ISBN ES INVALIDO'
  end
end
def buscar_autor(cola)
    #se buscara por medio del autor, y debe mostrar el nombre de todos los libros que estan en la pila
    #con su total de existencia
   # puts 'INGRESE EL AUTOR QUE DESEA BUSCAR '
   # libroa= gets.upcase.delete(' ')
   # if libroa ==
   #   puts
   # else
   #   puts 'EL AUTOR NO TIENE EXISTENCIAS'
   # end
   limpiar
   puts "ingrese el valor que desea buscar"
   nom_autor=gets.chomp.upcase
   elemento = cola[:fondo]       
   if elemento[:nombre] == nom_autor
    # mostrar los libros tambien
    puts "NOMBRE DEL AUTOR: #{elemento[:nombre]}"
   end
   begin
         nuevo_elemento = elemento[:siguiente]
         elemento = nuevo_elemento
         if  elemento[:nombre] == nom_autor
                # mostrar los libros tambien
           puts "NOMBRE DEL AUTOR: #{elemento[:nombre]}"
         end
     end while elemento[:siguiente] != nil
     gets
end
def registrar_venta()
    #Los empleados generaran ventas, pero solo almacenaremos las ultimas 20 ventas dentro de una cola
    #En una venta los clientes pueden adquirir uno o mas libros, el sistema solo debe permitir un venta
    #por una y almacenarlos en la cola de venta.
    #Si el cliente adquiere mas de un ejemplar en una sola venta : 3libros diferentes 10% de descuento sobre el total
    #4 libros diferentes 20% de descuento sobre el total de venta , si los libros comprados son al menos de 3 autores
    #diferentes tiene un descuento adicional del 5%
    #debe generar un codigo unico por venta, la cola donde se almacenan las ventas es de detamaño limitado
    #El total de descuentos se calculan al finalizar la venta
    #Debe mostrar el detalle de la venta en todo momento
    #Colocar un codigo a la venta
    #nombre del cliente , nit Y  NUMERO DE FACTURA
    # en la cola de 20 se ingresara una cola auxiliar , que va a contener los datos de la venta , para que la venta pueda
    # cumplir de forma correcta con el descuento , se debera comparar el nit , el numero de factura ... si son iguales
    # se trabajarar sobre la misma cola ,hasta que la condicon ya no se cumpla . el numero de factura  debe de ser
    # ingresado por el colaborador .
end
def buscar_venta()
    #se debe ver el detalle en especifico , debe mostrar codigo, la cola de libros vendidos, subtotal, descuentos
    #y total de la venta, solo se almecenan solo 20 ventas, si la venta ya fue eliminada o no existente el mensaje
    #debe mostrar un mensaje con esta alerta, debe respetar el orden de la pila
end
def listado_de_ventas()
    #debe mostar el codigo , cantidad de libros comprados, subtotal, descuentos y total por cada una de las ventas.
    #imprimir la colota
end

colautores={
    topeC:nil,
    finalC:nil,
    maxC:5,
    vaciaC:true,
    llenaC:false,
    tamañoC:0
}


cola = {
  fondo: nil,
  tope: nil,
  max:5,
  esta_vacia: true,
  tamaño:0,
  esta_llena: false
}
totalautores=0
nombre_del_autor_en_la_pila1=nil
nombre_del_autor_en_la_pila2=nil
nombre_del_autor_en_la_pila3=nil
nombre_del_autor_en_la_pila4=nil
nombre_del_autor_en_la_pila5=nil
begin
#menu principal , y bienvenida
puts "Bienvenido al programa de la libreria"
puts "En este programa podra manejar de mejor manera los libros"
puts "Seleccione la opcion deseada"
puts "1. Administracion de libros"
puts "2. Control de ventas"
puts "3. Salir"
opcion=gets.chomp
if opcion=='1'
    #Administracion de libros
    #menu para la primera opcion
    puts "Seleccione alguna opcion del menu"
    puts "1. Registro de nuevo libro"
    puts "2. Registro de autores"
    puts "3. Listado de libros"
    puts "4. Listado de autores"
    puts "5. Buscar por libro"
    puts "6. Buscar por autor"
    puts "7. Regresar"
    opcion=gets.chomp
    if opcion=='1'
    puts 'Bienvenido a la libreria.'
    puts "En esta opcion usted podra ingresar un libro , con ciertos datos especificos"
    puts "Ingrese el ISBN del libro"
    the_isbn = gets.chomp.upcase
    puts "Ingrese el nombre del libro"
    nombre_libro = gets.chomp.upcase
    puts "Ingrese el nombre del autor"
    nombre_autor=gets.chomp.upcase
    puts "Ingrese el precio del libro"
    puts "En esta opcion no necesita ingresar la Q. solo debe ingresar el valor numerico"
    precio_libro=gets.chomp
    puts "Ingrese el total de libros que esta ingresando"
    existencias_libro=gets.chop.to_i
      
    registro_de_nuevos_libros(cola,the_isbn,nombre_libro,nombre_autor,precio_libro,existencias_libro)
    
    puts cola
    

    elsif opcion=='2'
        # registro de autores
        registrosautores(cola)
    elsif opcion=='3'
        #listado de libros
    elsif opcion=='4'
        #listado de autores
        listadoautores(cola)
    elsif opcion=='5'
        #buscar por nombre del libro
    elsif opcion == '6'
        #buscar por nombre del autor
        buscar_autor(cola)
    elsif opcion =='7'
        #regresar
    end
elsif opcion=='2'
    #Contro de ventas
    #menu para la segunda opcion
    puts "1. Registrar venta"
    puts "2. Buscar una venta"
    puts "3. Listado de ventas"
    puts "4. Regresar"
    opcion=gets.chomp
    if opcion=='1'
        #registro de nuevo libro
    elsif opcion=='2'
        # registro de autores
    elsif opcion=='3'
        #listado de libros
    elsif opcion=='4'
    end
#elsif opcion=='3'
 #   puts "Gracias por utilizar el programa"
end
end while opcion!='3'