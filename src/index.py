import numpy as np


MU_EARTH = 398600.0  # km^3/s^2
R_EARTH = 6378.0  # km


def heading(problem):
    print(f"\n------\n {problem}\n------")


def main():
    np.set_printoptions(precision=9, suppress=True)
    print(f"mu = {MU_EARTH:g} km^3/s^2; R_E = {R_EARTH:g} km")

    #########
    # p2.10 #
    #########
    heading("p2.10")
    r_vec = np.array([7000.0, -2000.0, -4000.0])
    v_vec = np.array([3.0, -6.0, 5.0])
    r = np.linalg.norm(r_vec)
    v = np.linalg.norm(v_vec)
    h_vec = np.cross(r_vec, v_vec)
    h = np.linalg.norm(h_vec)
    r_dot_v = np.dot(r_vec, v_vec)
    e_vec = np.cross(v_vec, h_vec) / MU_EARTH - r_vec / r
    e = np.linalg.norm(e_vec)
    cos_theta = np.dot(e_vec, r_vec) / (e * r)
    sin_theta = np.dot(np.cross(e_vec, r_vec), h_vec) / (e * r * h)
    theta = np.arctan2(sin_theta, cos_theta) % (2 * np.pi)
    energy = v**2 / 2 - MU_EARTH / r

    print(f"r = {r:.9f} km; v = {v:.9f} km/s")
    print(f"h vector = {h_vec} km^2/s; h = {h:.9f} km^2/s")
    print(f"r dot v = {r_dot_v:.9f} km^2/s")
    print(f"e vector = {e_vec}; e = {e:.9f}")
    print(f"cos(theta) = {cos_theta:.9f}; sin(theta) = {sin_theta:.9f}")
    print(f"theta = {np.degrees(theta):.9f} deg (outbound)")

    np.testing.assert_allclose(e**2, 1 + 2 * energy * h**2 / MU_EARTH**2)
    np.testing.assert_allclose(r, h**2 / (MU_EARTH * (1 + e * np.cos(theta))))
    np.testing.assert_allclose(
        v, MU_EARTH / h * np.sqrt(1 + 2 * e * np.cos(theta) + e**2)
    )

    #########
    # p2.12 #
    #########
    heading("p2.12")
    v_vec = np.array([-4.0, 3.0, -5.0])
    u_r_given = np.array([0.26726, 0.53452, 0.80178])
    # restore unit length after rounding in the problem statement
    u_r = u_r_given / np.linalg.norm(u_r_given)
    v_r = np.dot(v_vec, u_r)
    v_perp_vec = v_vec - v_r * u_r
    v_perp = np.linalg.norm(v_perp_vec)
    gamma = np.arctan2(v_r, v_perp)

    print(f"given radial vector norm = {np.linalg.norm(u_r_given):.12f}")
    print(f"unit radial vector = {u_r}")
    print(f"v_r = {v_r:.9f} km/s")
    print(f"v_perp = {v_perp:.9f} km/s")
    print(f"gamma = {np.degrees(gamma):.9f} deg (inbound)")

    np.testing.assert_allclose(np.dot(u_r, v_perp_vec), 0, atol=1e-12)
    np.testing.assert_allclose(v_r**2 + v_perp**2, np.dot(v_vec, v_vec))

    #########
    # p2.15 #
    #########
    heading("p2.15")
    h = 60e3
    r = h**2 / MU_EARTH
    v = MU_EARTH / h
    period = 2 * np.pi * h**3 / MU_EARTH**2

    print(f"r = {r:.9f} km; v = {v:.9f} km/s")
    print(f"T = {period:.9f} s = {period / 3600:.9f} hr")
    np.testing.assert_allclose(period, 2 * np.pi * r / v)

    #########
    # p2.22 #
    #########
    heading("p2.22")
    r_p = R_EARTH + 500.0
    r_a = R_EARTH + 2000.0
    a = (r_p + r_a) / 2
    e = (r_a - r_p) / (r_a + r_p)
    v_p = np.sqrt(MU_EARTH * (2 / r_p - 1 / a))
    v_a = np.sqrt(MU_EARTH * (2 / r_a - 1 / a))
    period = 2 * np.pi * np.sqrt(a**3 / MU_EARTH)

    print(f"r_p = {r_p:g} km; r_a = {r_a:g} km; a = {a:g} km")
    print(f"e = {e:.9f}")
    print(f"v_p = {v_p:.9f} km/s; v_a = {v_a:.9f} km/s")
    print(f"T = {period:.9f} s = {period / 60:.9f} min")

    np.testing.assert_allclose(r_p * v_p, r_a * v_a)
    np.testing.assert_allclose((r_p * v_p)**2, MU_EARTH * a * (1 - e**2))
    np.testing.assert_allclose(v_p**2 / 2 - MU_EARTH / r_p, -MU_EARTH / (2 * a))
    np.testing.assert_allclose(v_a**2 / 2 - MU_EARTH / r_a, -MU_EARTH / (2 * a))

    print("\nAll numerical consistency checks passed.")


if __name__ == "__main__":
    main()
