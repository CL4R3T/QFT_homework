#import "@preview/problemst:0.1.0": pset
#import "@preview/physica:0.9.3": *

#show: pset.with(
  class: "QFT",
  student: read("../.authorinfo"),
  title: "Homework 1",
  date: datetime(year: 2024, month: 9, day: 26),
)

#set heading(numbering: (..nums) => {
  nums = nums.pos()
  nums.at(0) -= 1
  if nums.len() == 1 {
    [Problem #nums.at(0):]
  } else {
    numbering("1.1.a.i", ..nums)
  }
})

#let vec3(letter) = math.upright(math.bold(letter))
#let cre(letter) = $a^dagger (vec3(letter))$
#let ann(letter) = $a(vec3(letter))$
#let veclen(k) = math.abs(vec3(k))

=

The energy of boson $omega_vec3(k)$ is

$
  E_vec3(k) = mel(vec3(k), H, vec3(k)) = bra(vec3(k)) H cre(k) ket(0)
  = bra(vec3(k)) cre(k) H ket(0) + mel(vec3(k), [H, cre(k)], 0)
  = mel(vec3(k), [H, cre(k)], 0)
$

here

$
  [H, cre(k)] &= [integral (d^3 l) / ((2 pi)^3 2) cre(l) ann(l) + "const", cre(k)]\
  &= integral (d^3 l) / ((2 pi)^3 2) (cre(l) [ann(k), ann(l)] + [cre(l), cre(k)] ann(l))\
  &= integral (d^3 l) / ((2 pi)^3 2) cre(l) (2 pi)^3 2 omega_vec3(k) delta(vec3(k)-vec3(l))\
  &= omega_vec3(k) cre(k)
$

then

$ E_vec3(k) = mel(vec3(k), omega_vec3(k) cre(k), 0) = mel(vec3(k), omega_vec3(k), vec3(k)) = omega_vec3(k) $


=
== Problem 2.9c)

Since we have

$
  tensor((S^(mu nu)_upright(V)),+rho,-tau) eq.triple hbar / i (
    g^(mu rho) tensor(delta,+nu,-tau)-g^(nu rho) tensor(delta,+mu,-tau)
  )
$

then

$ (i S^12_upright(V)) / hbar = mat(0,0,0,0;0,0,+1,0;0,-1,0,0;0,0,0,0,) $

Differential of $Lambda$ gives

$
  dv(Lambda,theta) = mat(0,0,0,0;0,-sin theta,-cos theta,0;0,cos theta,-sin theta,0;0,0,0,0) = - (i S^12_upright(V)) / hbar Lambda
$

while

$ tensor(Lambda,+mu,-nu)|_(theta=0) = tensor(delta,+mu,-nu) $

which gives

$ Lambda = exp(-i theta S^12_upright(V)\/hbar) $

== Problem 2.9d)

Since we have

$
  tensor((S^(mu nu)_upright(V)),+rho,-tau) eq.triple hbar / i (
    g^(mu rho) tensor(delta,+nu,-tau)-g^(nu rho) tensor(delta,+mu,-tau)
  )
$

then

$ (i S^30_upright(V)) / hbar = mat(0,0,0,+1;0,0,0,0;0,0,0,0;+1,0,0,0,) $

Differential of $Lambda$ gives

$
  dv(Lambda,eta) = mat(sinh eta,0,0,cosh eta;0,0,0,0;0,0,0,0;cosh eta,0,0,sinh eta) = + (i S^30_upright(V)) / hbar Lambda
$

while

$tensor(Lambda,+mu,-nu)|_(eta=0) = tensor(delta,+mu,-nu)$

which gives

$ Lambda = exp(-i eta S^30_upright(V)\/hbar) $


=

Using eqs. (3.29) we get

$
  [H, cre(k)] &= [integral (d^3 l) / ((2 pi)^3 2) cre(l) ann(l) + "const", cre(k)]\
  &= integral (d^3 l) / ((2 pi)^3 2) (cre(l) [ann(k), ann(l)] + [cre(l), cre(k)] ann(l))\
  &= integral (d^3 l) / ((2 pi)^3 2) cre(l) (2 pi)^3 2 omega_vec3(k) delta(vec3(k)-vec3(l))\
  &= omega_vec3(k) cre(k)
$

then

$
  H ket(k_1 k_2 dots k_n) &= H cre(k_1) cre(k_2) dots cre(k_n) ket(0)\
  &= ([H, cre(k_1)] + cre(k_1) H) cre(k_2) dots cre(k_n) ket(0)\
  &= omega_1 cre(k_1) cre(k_2) dots cre(k_n) ket(0) + cre(k_1) H cre(k_2) dots cre(k_n) ket(0)\
  &= (omega_1 + dots + omega_n) cre(k_1) cre(k_2) dots cre(k_n) ket(0) + cre(k_1) cre(k_2) dots cre(k_n) H ket(0)\
  &= (omega_1 + dots + omega_n) ket(k_1 k_2 dots k_n)
$

So $ket(k_1 k_2 dots k_n)$ is an eigenstate of $H$ with eigenvalue $omega_1 + dots + omega_n$.


=

#let ftphi = $tilde(phi)_a (k)$

$
  [H, ftphi] &= [H, integral d^4x e^(-i k dot x) phi_a (x)]\
  &= integral dd(x,4) e^(-i k dot x) [H, phi_a (x)]\
  &= -i integral dd(x,4) e^(-i k dot x) pdv(phi_a (x),t)\
  &= -i integral dd(x,3) e^(- vec3(k) dot vec3(x)) integral dd(t) e^(i k^0 t) pdv(phi_a (x),t)\
  &= i integral dd(x,3) e^(- vec3(k) dot vec3(x)) integral dd(t) phi_a (x) pdv(e^(i k^0 t),t)\
  &= - k^0 integral dd(x,4) e^(- k dot x) phi_a (x)\
  &= - k^0 ftphi
$

Similarly,

$ [P^i, ftphi] = - k^i ftphi $

Hence,

$
  H ftphi ket(Psi) &= [H, ftphi] ket(Psi) + ftphi H ket(Psi)\
  &= (E-k^0) ftphi ket(Psi)
$

and

$
  P^i ftphi ket(Psi) &= [P^i, ftphi] ket(Psi) + ftphi P^i ket(Psi)\
  &= (p^i-k^i) ftphi ket(Psi)
$

then the state $ftphi ket(Psi)$ have energy $E' = E - k^0$ and momentum $vec3(p)' = vec3(p) - vec3(k)$.


=

== Evaluation of the integral

It is obvious that $C(x)$ is only related to $x^0$ and $veclen(x)$, so it is proper to assume that $vec3(x)= (veclen(x),0,0)$, in order to make the integral easier.

Introducing variants $eta in [0,+infinity), theta in [0,pi], phi in [0,2 pi)$ satisfying the relation below:

$ vec3(k) eq.triple (k^1, k^2, k^3) eq.triple omega_0 eta (cos theta, sin theta cos phi, sin theta sin phi) $

then

$ omega_vec3(k) = sqrt(omega_0^2+veclen(k)^2) = omega_0 sqrt(1 + eta^2) $

and

$
  tilde(dd(k)) eq.triple dd(k,3) / ((2 pi)^3 2 omega_vec3(k))
  = (omega_0^2 eta^2 sin theta dd(eta) dd(theta) dd(phi)) / ((2 pi)^3 2 sqrt(1 + eta^2))
$

So we get

$
  C(x) &= -i c_+ integral (omega_0^2 eta^2 sin theta dd(eta) dd(theta) dd(phi)) / ((2 pi)^3 sqrt(1 + eta^2))
  sin(omega_0 x^0 sqrt(1 + eta^2))e^(i omega_0 veclen(x) eta cos theta )\
  &= -(i c_+ omega_0^2) / (2 pi)^2 integral_0^(+infinity)dd(eta)
  integral_(-1)^(+1)dd((cos theta))
  eta^2 / sqrt(1 + eta^2) sin(omega_0 x^0 sqrt(1 + eta^2))e^(i omega_0 veclen(x) eta cos theta )\
  &= -(2i c_+ omega_0) / ((2 pi)^2 veclen(x)) integral_0^(+infinity)dd(eta) eta / sqrt(1 + eta^2) sin (
    omega_0 veclen(x) eta
  )sin(omega_0 x^0 sqrt(1 + eta^2))\
$

Using eq.3.876(1) from _Table of Integrals, Series, and Products (Seventh Edition)_ by Gradshteyn and Ryzhik:

$
  integral_0^infinity sin(p sqrt(x^2+a^2)) / sqrt(x^2+a^2)cos(b x)dd(x) = cases(pi/2 J_0(abs(a) sqrt(p^2-b^2)) " " &[0<b<p],0 &[0<p<b]) " "[
    a>0
  ]
$

which equals to

$
  integral_0^infinity sin(p sqrt(x^2+a^2)) / sqrt(x^2+a^2)cos(b x)dd(x) = sgn(p)theta(p^2-b^2)pi / 2 J_0(
    abs(a) sqrt(p^2-b^2)
  )
$

Differential of both sides with respect to $b$ gives

$
  -integral_0^infinity sin(p sqrt(x^2+a^2)) / sqrt(x^2+a^2)x sin(b x)dd(x) = sgn(p)(
    (pi abs(a) b) / (2 sqrt(p^2-b^2)) theta(p^2-b^2)J_1(abs(a) sqrt(p^2-b^2)) - pi b delta(p^2-b^2)
  )
$

Taking $x=eta, a=1, b=omega_0 veclen(x), p=omega_0 x^0$ gives

$
  C(x)&=(2i c_+ omega_0) / ((2 pi)^2 veclen(x)) sgn(omega_0 x^0) (
    (pi omega_0 veclen(x)) / (2 omega_0 tau) theta(omega_0^2 tau^2) J_1(
      omega_0 tau
    )-pi omega_0 veclen(x) delta(omega_0^2 tau^2)
  )\
  &=c_+sgn(x^0)(i omega_0 theta(tau^2) (J_1(omega_0 tau)) / (4 pi tau) - i / (2pi) delta(tau^2))
$

here $tau = sqrt((x^0)^2-veclen(x)^2) = sqrt(-x^2)$.

With the commutator relation $[phi(x), phi(y)] = C(x-y)$, we have

$
  [phi(x), phi(y)] = c_+ sgn(x^0-y^0)(i omega_0 theta(tau^2) (J_1(omega_0 tau)) / (4 pi tau) - i / (2pi) delta(tau^2))
$

here $tau = sqrt(-(x-y)^2)$.

== spacelike intevals

If $-tau^2=(x-y)^2>0$, then $theta(tau^2)=delta(tau^2)=0$, which will give $[phi(x),phi(y)]=0$.

== $0<tau^2<<omega_0^(-2)$

Since $J_1(x) = 1/2 x+ o(x^3)$, we have

$
  [phi(x), phi(y)] = c_+ sgn(x^0-y^0)(i omega_0^2) / (8 pi)+o(tau^2)
$

== $tau^2 >> omega_0^2$

The approximation of $J_1(x)$ when $x->infinity$ is

$
  J_1(x) tilde sqrt(2/(pi x)) cos(x-3/4 pi)
$

So we have

$
  [phi(x), phi(y)] &= c_+ sgn(x^0-y^0)(i omega_0) / (4 pi tau)sqrt(2/(pi omega_0 tau)) cos(omega_0 tau - 3/4 pi)\
  &=c_+ sgn(x^0-y^0)(i omega_0^(1 / 2)) / (2 pi tau)^(3 / 2) cos(omega_0 tau- 3/4 pi)
$

== Dirac $delta$ term

If $t eq.triple x^0-y^0>0$, the second term is

$
  -(i c_+) / (2pi) delta(tau^2) &= -(i c_+) / (2pi) delta(veclen(x-y)^2-t^2)\
  &= -(i c_+) / (2pi) delta((veclen(x-y)+t)(veclen(x-y)-t))\
  &= -(i c_+) / (2pi (veclen(x-y)+t)) delta(veclen(x-y)-t)\
  &= -(i c_+) / (2pi (t+t))delta(veclen(x-y)-t)\
  &= -(i c_+) / (4pi) t^(-1) delta(veclen(x-y)-t)\
$

Thus the constant $alpha=1$

== the dimension

Since $sgn(x)$ is dimensionless and $delta(x)$ have the dimension of $[x]^(-1)$, the dimension of $C(x)$ is

$ [C(x)] = [c_+ delta(tau^2)] = [tau]^(-2) = ("length")^(-2) $

Then we have

$ [phi(x)] = [C(x)]^(1 / 2) = ("length")^(-1) $
