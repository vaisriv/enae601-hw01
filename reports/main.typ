#import "@preview/adaptable-pset:0.2.0": *
#import "@preview/physica:0.9.8": *
#import "@preview/unify:0.8.1": *

// upright vectors
#let vectorboldupright(a) = vb($upright(#a)$)
#let vbu = vectorboldupright
#let vectorunitupright(a) = vu($upright(#a)$)
#let vuu = vectorunitupright
#let vectorarrowupright(a) = va($upright(#a)$)
#let vau = vectorarrowupright

// assignment info
#show: homework.with(
    title: "HW01",
    author: "Vai Srivastava",
    collaborators: [],
    course-id: "ENAE 601: Astrodynamics",
    instructor: "Dr. Healy",
    semester: "Fall 2026",
    due-time: "September 16th. at 23:59",

    // (defaults to A4)
    paper-size: "us-letter", 
)

#set text(font: "New Computer Modern")
#set enum(numbering: "a)")

#prob(title: "2.7", color: black)[
    Starting with #link(<eqn:2.35a>)[Eq. 2.35a (shown below)], prove that $dot(r) = vbu(v) dprod vuu(u)_r$ and interpret this result.
    $ vbu(r) dprod dot(vbu(r)) = r dot(r) $ <eqn:2.35a>
]

answer

#prob(title: "2.8", color: black)[
    Show that $vuu(u)_r dprod dv(vuu(u)_r, t) = 0$, where $vuu(u)_r = vbu(r)/r$. Use only the fact that $vuu(u)_r$ is a unit vector. Interpret this result.
]

answer

#pagebreak(weak: true)

#prob(title: "2.9", color: black)[
    Show that $v = (mu / h) sqrt(1 + 2 e cos(theta) + e^2)$ for any orbit.
]

answer

#pagebreak(weak: true)

#prob(title: "2.10", color: black)[
    Relative to a nonrotating, earth-centered Cartesian coordinate system, the position and velocity vectors of a spacecraft are $vbu(r) = 7000 vuu(i) - 2000 vuu(j) - 4000 vuu(k) unit("km")$ and $vbu(v) = 3 vuu(i) - 6 vuu(j) + 5 vuu(k) unit("km/s")$. Calculate:
    1. The orbit's eccentricity vector
    2. The true anomaly
]

answer

#pagebreak(weak: true)

#prob(title: "2.11", color: black)[
    Show that the eccentricity is 1 for rectilinear orbits ($vbu(h) = vb(0)$).
]

answer

#pagebreak(weak: true)

#prob(title: "2.12", color: black)[
    Relative to a nonrotating, earth-centered Cartesian coordinate system, the velocity of a spacecraft is $vbu(v) = -4 vuu(i) + 3 vuu(j) - 5 vuu(k) unit("km/s")$ and the unit vector in the direction of the radius $vbu(r)$ is $vuu(u)_r = 0.26726 vuu(i) + 0.53452 vuu(j) + 0.80178 vuu(k)$. Calculate:
    1. The radial component of velocity $v_r$
    2. The azimuth component of velocity $v_perp$
    3. The flight path angle $gamma$
]

answer

#pagebreak(weak: true)

#prob(title: "2.13", color: black)[
    If the specific energy $epsilon$ of the two-body problem is negative, show that $m_2$ cannot move outside a sphere of radius $mu/abs(epsilon)$ centered at $m_1$.
]

answer

#pagebreak(weak: true)

#prob(title: "2.15", color: black)[
    The specific angular momentum of a satellite in circular earth orbit is #qty("60e3", "km^2/s"). Calculate the period.
]

answer

#pagebreak(weak: true)

#prob(title: "2.17", color: black)[
    Calculate the area $A$ swept out during the time $t = T/4$ since periapsis, where $T$ is the period of the elliptical orbit. See #link(<fig:p2.17>)[the figure] below.

    #figure(
        image("../references/p2.17.png", width: 50%)
    ) <fig:p2.17>
]

answer

#pagebreak(weak: true)

#prob(title: "2.22", color: black)[
    The altitude of a satellite in an elliptical orbit around the earth is #qty(2000, "km") at apogee and #qty(500, "km") at perigee. Determine:
    1. The eccentricity of the orbit
    2. The orbital speeds at perigee and apogee
    3. The period of the orbit
]

answer
