# Encurtador de URL

### Primicia
Você deve prover uma rota para encurtar URLs, e ao acessar a URL encurtada deve redirecionar para a URL original.

### Necessário
- Prover um endpoint que retorne um JSON com o seguinte formato:
```
POST: /shorten_url , url: http://minhaurl.com
{ 
	newUrl: "http://localhost:3000/url", 
}
```

- Utilizar um baco de dados para guardar a URL original
- Contar a quantidade de acessos a URL encurtada
- Realizar o direcionamento para a URL original pela URL encurtada
- Após 1 ano a URL deve ser inutilizada (ainda não foi feito)

```
Acesso: http://localhost:3000/url -> redirecionado para -> http://minhaurl.com
```
