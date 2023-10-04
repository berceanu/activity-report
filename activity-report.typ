#let mk_header(
  proiect,
  contract,
  anexa,
) = {
    set text(font: "DejaVu Sans", 12pt)
    show text: strong
    stack(dir: ltr,
        [#upper(proiect) \
         #upper(contract)],
        1fr,
        [#upper(anexa)]
    )
    v(2em)
}

#let mk_title(
  title,
) = {
  set text(font: "DejaVu Sans", 14pt)
  show text: strong
  align(center, [#upper(title)])
}

#let mk_date(
  month,
) = {
  set text(font: "DejaVu Sans", 12pt)
  align(center, [*Perioada:* #month])
}

#let mk_name_position(
  your_name,
  your_position,
) = {
  v(2em)
  block[
  *Numele și prenumele:* #your_name \
  *Funcția în cadrul proiectului:* #your_position
  ]
  v(2em)
}

#let activities = [*În această perioadă au fost desfășurate următoarele activități.*] + v(1em)

#let results = v(2em) + [*În urma desfășurării activităților prezentate, au fost obținute următoarele rezultate.*] + v(1em)

#let mk_signatures(
  department_head,
  scientific_director,
  sign_date,
) = {
  v(2em)
  stack(dir: ltr,
  block[
    *Data:* #sign_date \
    *Semnătura,* \
    #image("signature.png", height: 2em)
  ],
  1fr,
  block[
    #upper(strong([Avizat,])) \ 
    *Șef LGED* \
    #department_head
    ],
  1fr,
  block[
    #upper(strong([Avizat,])) \ 
    *Director Științific* \
    #text(if scientific_director == none {
      hide("a")
      } else {
        scientific_director
      })
      ]
  )  
}


#let report(
  proiect: "Proiect ELI-NP",
  contract: "Contract Finanțare nr. 1/2016",
  anexa: "Anexa I-4",
  title: "Raport de Activitate",
  month: none,
  your_name: "Berceanu Andrei",
  your_position: "CS-III",
  sign_date: none,
  department_head: "Ovidiu Teșileanu",
  scientific_director: "Victor Malka",
  body,
) = {
  set page(
    paper: "a4",
    margin: (top: 2cm, bottom: 2cm, left: 2cm, right: 2cm),
  )
  mk_header(proiect, contract, anexa)
  mk_title(title)
  mk_date(month)
  
  set text(
    lang: "ro",
    font: "Linux Libertine", 
    size: 12pt,
  )
  set par(
    justify: true,
  )

  mk_name_position(your_name, your_position)

  body
  
  mk_signatures(department_head, scientific_director, sign_date)
}
