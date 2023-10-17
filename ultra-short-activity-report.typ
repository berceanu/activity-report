#let mk_header(
  proiect,
  contract,
) = {
    set text(font: "DejaVu Sans", 12pt)
    show text: strong
    stack(dir: ltr,
        [#upper(proiect) \
         #upper(contract)]
    )
    v(1fr)
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
  align(center, [*Period:* #month])
}

#let mk_name_position(
  your_name,
  your_position,
) = {
  v(1fr)
  block[
  *Full Name:* #your_name \
  *Position within the project:* #your_position
  ]
}

#let activities = v(1fr) + [*During this period, the following activities have been carried out.*] + v(1em)


#let mk_signatures(
  department_head,
  group_leader,
  sign_date,
) = {
  v(1fr)
  grid(
    columns: (1fr, 1fr, 1fr),
    rows: (auto, auto, auto),
    row-gutter: 0.5em,
    align(left)[*Date:* #sign_date],
    align(center, upper(strong("Endorse,"))), 
    align(right, upper(strong("Endorse,"))), 
    align(left)[*Signature,*],
    align(center)[*Head of LGED*],
    align(right)[*Group Leader*],
    align(left, move(dy: -0.4em, image("signature.png", height: 1em))),
    align(center, department_head),
    align(right, group_leader),
  )
  v(2em)
}


#let report(
  proiect: "ELI-NP Project",
  contract: "Financing Contract no. 1/2016",
  title: "Short Activity Report",
  month: none,
  your_name: "Berceanu Andrei",
  your_position: "CS-III",
  sign_date: none,
  department_head: "Ovidiu Teșileanu",
  group_leader: "Ștefan Ataman",
  body,
) = {
  set document(
    title: title,
    author: your_name,
  )
  set page(
    paper: "a4",
    margin: (top: 1.5cm, bottom: 1.5cm, left: 2cm, right: 2cm),
  )
  mk_header(proiect, contract)
  mk_title(title)
  mk_date(month)
  
  set text(
    lang: "en",
    font: "Linux Libertine", 
    size: 12pt,
  )
  set par(
    justify: true,
  )

  mk_name_position(your_name, your_position)

  body
  
  mk_signatures(department_head, group_leader, sign_date)
}
