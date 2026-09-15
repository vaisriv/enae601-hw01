#import "@preview/adaptable-pset:0.2.0": *

#let title = "HW01"
#let author = "Vai Srivastava"
#let collaborators = []
#let course-id = "ENAE 601: Astrodynamics"
#let instructor = "Dr. Healy"
#let semester = "Fall 2026"
#let due-time = "September 16th. at 23:59"

#show: homework.with(
    title: title,
    author: author,
    collaborators: collaborators,
    course-id: course-id,
    instructor: instructor,
    semester: semester,
    due-time: due-time,

    // (Defaults to A4)
    paper-size: "us-letter", 
)

#set text(font: "New Computer Modern")
#set enum(numbering: "a)")

#prob(title: "2.7", color: black)[
    Starting with Eq. 2.35a (shown below), prove that $dot(r) = bold("v") dot hat(bold("u"))_r$ and interpret this result.
    $ bold("r") dot bold(dot("r")) = r dot(r) $
]

answer

#prob(title: "2.8", color: black)[
    Show that $bold(hat("u"))_r dot (dif bold(hat("u"))_r)/(dif t) = 0$, where $bold(hat("u"))_r = bold("r")/r$. Use only the fact that $bold(hat("u"))_r$ is a unit vector. Interpret this result.
]

answer

#prob(title: "2.9", color: black)[
    problem
]

answer

#prob(title: "2.10", color: black)[
    problem
]

answer

#prob(title: "2.11", color: black)[
    problem
]

answer

#prob(title: "2.12", color: black)[
    problem
]

answer

#prob(title: "2.13", color: black)[
    problem
]

answer

#prob(title: "2.15", color: black)[
    problem
]

answer

#prob(title: "2.17", color: black)[
    problem
]

answer

#prob(title: "2.22", color: black)[
    problem
]

answer
