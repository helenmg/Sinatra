# Base de datos en memoria

Esta es la base de datos en memoria:

```
class Datos
  def self.save(invitacion) #metodo estatico(para no crear objetos para usarlo)
    if @invitaciones.nil? 
      @invitaciones = []
    end
    @invitaciones << invitacion
  end

  def self.list
    return [] if @invitaciones.nil? #variable de clase

    @invitaciones
  end
end
```

En el controlador se pone algo como:

```
Datos.save(dato) # para guardar
Datos.list       # para listar los datos almacenados
```

En la vista se pone algo como:

```
<% @invitaciones.each do |invitacion| %>
  <div>
    <p><%= invitacion.novio %></p>
    <p><%= invitacion.novia %></p>
    <p><%= invitacion.fecha %></p>
  </div>
<% end %>
```