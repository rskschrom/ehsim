!--------------------------------
! Main program to simulate
! electric and magnetic fields
!
! Robert Schrom 7/31/17
!--------------------------------
program ehsim
    use constants
    use numerical
    implicit none

    ! grid parameters
    integer, parameter :: numx = 9, numy = 9, numz = 9, numt = 10
    integer :: i, j, k, ti
    double precision, parameter :: ds = 10.d-6
    double precision, dimension(numx+1, numy+1, numz+1) :: er
    double precision, dimension(numx+1, numy+1, numz+1) :: ei

    ! magnetic field
    double precision, dimension(numx, numy, numz+1) :: hz
    double precision, dimension(numx, numy+1, numz) :: hy
    double precision, dimension(numx+1, numy, numz) :: hx

    ! electric field
    double precision, dimension(numx+1, numy+1, numz) :: ez
    double precision, dimension(numx+1, numy, numz+1) :: ey
    double precision, dimension(numx, numy+1, numz+1) :: ex

    ! initialize fields, optical properties, and plane wave source
    ez = 0.d0
    ey = 0.d0
    ex = 0.d0
    hz = 0.d0
    hy = 0.d0
    hx = 0.d0

    ! ice cube
    er = 1.d0
    ei = 0.d0
    er(3:5, 3:5, 3:5) = er_ice_x
    ei(3:5, 3:5, 3:5) = ei_ice_x

end program
