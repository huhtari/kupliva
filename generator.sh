#!/usr/bin/env bash


cat <<EOF
<html>
<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="styles.css">
        
</head>

<body>
<h1>Kupliva</h1>
<input type="text" id="input" />
<div id="debug"></div>
<ul>
EOF

while IFS=$'\t' read -r picture name comment; do
  echo "<li><div class=\"item\">"
  echo "<img src=\"${picture}\">"
  echo "<div class=\"text\"><h3>${name}</h3>"
  echo "<p>${comment}</p></div>"
  echo "</div></li>"
done

cat <<EOF
</ul>
<div id="debug"></div>
</body>
<script type="text/javascript">
   var input = document.getElementById('input'),
      lis = [].slice.call(document.querySelectorAll('li')),
      liText,
      hasText,
      len;

  input.oninput = function () {
    var search = input.value.toUpperCase().split(' '),
    i = 0;
//    document.getElementById('debug').innerText = value
    for (i=lis.length;i--;) {
//      document.getElementById('debug').innerText = document.getElementById('debug').innerText + ';' + lis[i].innerText
      liText = lis[i].innerText.toUpperCase();
      hasTexts = search.every(s => liText.includes(s));
      lis[i].style.display = hasTexts
                               ? 'list-item'
                               : 'none';
    }
  }
</script>
</html>
EOF