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

#set text(font: "New Computer Modern", size: 10pt)
#set enum(numbering: "a)")

#prob(title: "2.7", color: black)[
    Starting with #link(<eqn:2.35a>)[Eq. 2.35a (shown below)], prove that $dot(r) = vbu(v) dprod vuu(u)_r$ and interpret this result.
    $ vbu(r) dprod dot(vbu(r)) = r dot(r) $ <eqn:2.35a>
] <hwk:p2.7>

Beginning with #link(<eqn:2.35a>)[Eq. 2.35a]:
$ vbu(r) dprod dot(vbu(r)) = r dot(r) $

Note that $r equiv abs(vbu(r))$ and $dot(vbu(r)) equiv vbu(v)$:
$ vbu(r) dprod vbu(v) = abs(vbu(r)) dot(r) $

Rearrange, with $r > 0$:
$ dot(r) = (vbu(r) dprod vbu(v))/abs(vbu(r)) $

Note that $vbu(r)/abs(vbu(r)) equiv vuu(r)$:
$ (vbu(r) dprod vbu(v))/abs(vbu(r)) = vuu(r) dprod vbu(v) $

From Eq. 2.7:
$ vuu(u)_r = vbu(r)/r = vbu(r)/abs(vbu(r)) = vuu(r) $

Thus:
$ dot(r) = vuu(u)_r dprod vbu(v) $

The dot product is commutative, so:
$ dot(r) = vuu(u)_r dprod vbu(v) = vbu(v) dprod vuu(u)_r $

We now have:
$ dot(r) = vbu(v) dprod vuu(u)_r quad qed $

The dot product projects the velocity onto the outward radial direction. Thus, $dot(r)$ is the radial component of velocity: it is positive when the spacecraft moves away from the attracting body, negative when it moves toward it, and zero when the velocity is perpendicular to the radius. A zero radial velocity does not imply that the spacecraft is stationary.

#pagebreak(weak: true)

#prob(title: "2.8", color: black)[
    Show that $vuu(u)_r dprod dv(vuu(u)_r, t) = 0$, where $vuu(u)_r = vbu(r)/r$. Use only the fact that $vuu(u)_r$ is a unit vector. Interpret this result.
]

Since $vuu(u)_r$ is a unit vector:
$ vuu(u)_r dprod vuu(u)_r = 1 $

Differentiate both sides with respect to time:
$ dv(vuu(u)_r dprod vuu(u)_r, t) = dv(1, t) = 0 $

Apply the product rule:
$ dv(vuu(u)_r, t) dprod vuu(u)_r + vuu(u)_r dprod dv(vuu(u)_r, t) = 0 $

The dot product is commutative, so:
$ 2 vuu(u)_r dprod dv(vuu(u)_r, t) = 0 $

Thus:
$ vuu(u)_r dprod dv(vuu(u)_r, t) = 0 quad qed $

A unit vector has constant magnitude, so its time derivative can only describe a change in direction. When nonzero, this derivative is perpendicular to the unit vector. If the direction is constant, the derivative is zero and the result still holds.

#pagebreak(weak: true)

#prob(title: "2.9", color: black)[
    Show that $v = (mu / h) sqrt(1 + 2 e cos(theta) + e^2)$ for any orbit.
]

Beginning with the orbit equation and the specific angular momentum:
$ r = (h^2 / mu)/(1 + e cos(theta)), quad h = r^2 dot(theta) $

Differentiate the orbit equation with respect to $theta$:
$ dv(r, theta) = (h^2 / mu) (e sin(theta))/(1 + e cos(theta))^2 $

Apply the chain rule and substitute $dot(theta) = h/r^2$:
$ dot(r) = dv(r, theta) dot(theta)
    = (h^2 / mu) (e sin(theta))/(1 + e cos(theta))^2 h/r^2 $

Substitute the orbit equation for $r$ and simplify:
$ v_r = dot(r) = (mu / h) e sin(theta) $

The transverse component of velocity is:
$ v_perp = r dot(theta) = h/r = (mu / h)(1 + e cos(theta)) $

Since the radial and transverse directions are perpendicular:
$ v^2 = v_r^2 + v_perp^2
    = (mu / h)^2 (e^2 sin(theta)^2 + (1 + e cos(theta))^2) $

Expand and use $sin(theta)^2 + cos(theta)^2 = 1$:
$ v^2 = (mu / h)^2 (1 + 2 e cos(theta) + e^2) $

Take the nonnegative square root:
$ v = (mu / h) sqrt(1 + 2 e cos(theta) + e^2) quad qed $

This result applies to circular, elliptical, parabolic, and hyperbolic orbits with $h > 0$. Rectilinear motion has $h = 0$, so this expression is undefined for that degenerate case.

#pagebreak(weak: true)

#prob(title: "2.10", color: black)[
    Relative to a nonrotating, earth-centered Cartesian coordinate system, the position and velocity vectors of a spacecraft are $vbu(r) = 7000 vuu(i) - 2000 vuu(j) - 4000 vuu(k) unit("km")$ and $vbu(v) = 3 vuu(i) - 6 vuu(j) + 5 vuu(k) unit("km/s")$. Calculate:
    1. The orbit's eccentricity vector
    2. The true anomaly
]

Using $mu = qty(398600, "km^3/s^2")$ for Earth.

1. The eccentricity vector

Beginning with the magnitudes and the specific angular momentum:
$ r = sqrt(7000^2 + (-2000)^2 + (-4000)^2) unit("km")
    = qty(8306.624, "km") $
$ v^2 = (3^2 + (-6)^2 + 5^2) unit("km^2/s^2")
    = qty(70, "km^2/s^2") $
$ vbu(h) = vbu(r) cprod vbu(v)
    = (-34000 vuu(i) - 47000 vuu(j) - 36000 vuu(k)) unit("km^2/s") $

The eccentricity vector is:
$ vbu(e) = (vbu(v) cprod vbu(h))/mu - vbu(r)/r $

Using the vector triple product, this may also be written as:
$ vbu(e) = 1/mu ((v^2 - mu/r) vbu(r) - (vbu(r) dprod vbu(v)) vbu(v)) $

Calculate the scalar product:
$ vbu(r) dprod vbu(v) = (7000(3) + (-2000)(-6) + (-4000)(5)) unit("km^2/s")
    = qty(13000, "km^2/s") $

Substitute and simplify:
$ vbu(e) approx 0.288759 vuu(i) + 0.085227 vuu(j) - 0.383986 vuu(k) quad qed $

Its magnitude is $e = abs(vbu(e)) approx 0.487945$.

2. The true anomaly

The true anomaly is measured from the eccentricity vector to the radius vector in the direction of motion:
$ cos(theta) = (vbu(e) dprod vbu(r))/(e r) approx 0.835592 $

Taking the inverse cosine gives the candidate angle:
$ theta_0 = arccos(0.835592) approx qty(33.3225, "deg") $

Since $vbu(r) dprod vbu(v) > 0$, the spacecraft is moving outward, so $0 < theta < qty(180, "deg")$. Thus, the correct quadrant gives:
$ theta approx qty(33.3225, "deg") quad qed $

#pagebreak(weak: true)

#prob(title: "2.11", color: black)[
    Show that the eccentricity is 1 for rectilinear orbits ($vbu(h) = vb(0)$).
]

Beginning with the eccentricity vector:
$ vbu(e) = (vbu(v) cprod vbu(h))/mu - vbu(r)/r $

For rectilinear motion, $vbu(h) = vb(0)$:
$ vbu(e) = (vbu(v) cprod vb(0))/mu - vbu(r)/r
    = -vbu(r)/r = -vuu(u)_r $

Since $vuu(u)_r$ is a unit vector:
$ e = abs(vbu(e)) = abs(-vuu(u)_r) = 1 quad qed $

This holds wherever $r > 0$. Rectilinear motion is a degenerate orbit: although $e = 1$, its specific energy need not be zero, so it need not be an ordinary parabolic trajectory.

#pagebreak(weak: true)

#prob(title: "2.12", color: black)[
    Relative to a nonrotating, earth-centered Cartesian coordinate system, the velocity of a spacecraft is $vbu(v) = -4 vuu(i) + 3 vuu(j) - 5 vuu(k) unit("km/s")$ and the unit vector in the direction of the radius $vbu(r)$ is $vuu(u)_r = 0.26726 vuu(i) + 0.53452 vuu(j) + 0.80178 vuu(k)$. Calculate:
    1. The radial component of velocity $v_r$
    2. The azimuth component of velocity $v_perp$
    3. The flight path angle $gamma$
]

The supplied unit-vector components are rounded. Their magnitude is approximately $0.999995353$, so I normalized them to unit length for the numerical calculation.

1. The radial component of velocity

From #link(<hwk:p2.7>)[Problem 1 (2.7)]:
$ v_r = vbu(v) dprod vuu(u)_r $

Substitute the normalized components:
$ v_r approx ((-4)(0.26726) + 3(0.53452) - 5(0.80178))/0.999995353 unit("km/s") $

Thus:
$ v_r approx qty(-3.4744, "km/s") quad qed $

2. The azimuth component of velocity

The speed is:
$ v = sqrt((-4)^2 + 3^2 + (-5)^2) unit("km/s") = sqrt(50) unit("km/s") $

Since the radial and azimuth directions are perpendicular:
$ v_perp = sqrt(v^2 - v_r^2) $

Substitute and simplify, retaining full precision in the calculation:
$ v_perp approx qty(6.1586, "km/s") quad qed $

Here, $v_perp$ is the nonnegative transverse speed in the orbital plane.

3. The flight path angle

Measure $gamma$ from the local horizontal, positive toward the outward radial direction:
$ tan(gamma) = v_r/v_perp $

Thus:
$ gamma = arctan(v_r/v_perp) approx qty(-29.4296, "deg") quad qed $

The negative radial velocity and flight path angle indicate that the spacecraft is moving toward Earth.

#pagebreak(weak: true)

#prob(title: "2.13", color: black)[
    If the specific energy $epsilon$ of the two-body problem is negative, show that $m_2$ cannot move outside a sphere of radius $mu/abs(epsilon)$ centered at $m_1$.
]

Beginning with the specific mechanical energy:
$ epsilon = v^2/2 - mu/r $

Since $epsilon < 0$, write $epsilon = -abs(epsilon)$ and rearrange:
$ v^2/2 = mu/r - abs(epsilon) $

The squared speed cannot be negative, so:
$ mu/r - abs(epsilon) >= 0 $

Therefore:
$ mu/r >= abs(epsilon) $

Since $r > 0$ and $abs(epsilon) > 0$:
$ r <= mu/abs(epsilon) quad qed $

At any greater distance, the energy equation would require $v^2 < 0$. Thus, $m_2$ cannot move outside the stated sphere. Equality requires zero instantaneous velocity; for a nonrectilinear orbit, $h > 0$ prevents this and the inequality is strict.

#pagebreak(weak: true)

#prob(title: "2.15", color: black)[
    The specific angular momentum of a satellite in circular earth orbit is #qty("60e3", "km^2/s"). Calculate the period.
]

For a circular orbit, the velocity is perpendicular to the radius and the centripetal acceleration equals the gravitational acceleration:
$ h = r v, quad v^2/r = mu/r^2 $

Thus:
$ v = sqrt(mu/r), quad h = sqrt(mu r) $

Solve for the orbital radius:
$ r = h^2/mu = (qty("60e3", "km^2/s"))^2/(qty(398600, "km^3/s^2"))
    approx qty(9031.611, "km") $

The period is the circumference divided by the constant speed:
$ T = (2 pi r)/v = 2 pi sqrt(r^3/mu) $

Substitute $r = h^2/mu$:
$ T = (2 pi h^3)/mu^2 $

Thus:
$ T approx qty(8541.99, "s") approx qty(2.37277, "hour") quad qed $

#pagebreak(weak: true)

#prob(title: "2.17", color: black)[
    Calculate the area $A$ swept out during the time $t = T/4$ since periapsis, where $T$ is the period of the elliptical orbit. See #link(<fig:p2.17>)[the figure] below.

    #figure(
        image("../references/p2.17.png", width: 50%)
    ) <fig:p2.17>
]

Beginning with the constant areal rate for a two-body orbit:
$ dv(A, t) = 1/2 r^2 dot(theta) = h/2 $

Measure the swept area from periapsis, so $A(0) = 0$. Integrate over the interval $t = T/4$:
$ A = integral_0^(T/4) h/2 dif t = (h T)/8 $

Over one complete period, the radius vector sweeps out the entire ellipse. For semimajor axis $a$ and semiminor axis $b$:
$ (h T)/2 = pi a b $

Thus, one quarter of the period sweeps out one quarter of the total area:
$ A = (pi a b)/4 = (pi a^2 sqrt(1 - e^2))/4 quad qed $

#pagebreak(weak: true)

#prob(title: "2.22", color: black)[
    The altitude of a satellite in an elliptical orbit around the earth is #qty(2000, "km") at apogee and #qty(500, "km") at perigee. Determine:
    1. The eccentricity of the orbit
    2. The orbital speeds at perigee and apogee
    3. The period of the orbit
]

Using $R_E = qty(6378, "km")$ and $mu = qty(398600, "km^3/s^2")$ for Earth.

1. The eccentricity of the orbit

Convert the given altitudes to distances from Earth's center:
$ r_p = R_E + qty(500, "km") = qty(6878, "km"), quad
    r_a = R_E + qty(2000, "km") = qty(8378, "km") $

The semimajor axis is:
$ a = (r_p + r_a)/2 = qty(7628, "km") $

Since $r_p = a(1 - e)$ and $r_a = a(1 + e)$:
$ e = (r_a - r_p)/(r_a + r_p) = (8378 - 6878)/(8378 + 6878)
    approx 0.098322 quad qed $

2. The orbital speeds at perigee and apogee

Apply the vis-viva equation at perigee:
$ v_p = sqrt(mu (2/r_p - 1/a)) approx qty(7.97815, "km/s") quad qed $

At apogee:
$ v_a = sqrt(mu (2/r_a - 1/a)) approx qty(6.54974, "km/s") quad qed $

As expected, the spacecraft moves faster at perigee, and $r_p v_p = r_a v_a$ confirms conservation of angular momentum.

3. The period of the orbit

For an elliptical orbit:
$ T = 2 pi sqrt(a^3/mu) $

Substitute $a = qty(7628, "km")$ and the Earth's gravitational parameter:
$ T approx qty(6630.21, "s") approx qty(110.503, "min") quad qed $
