!--------------------------------
! Main program to simulate
! electric and magnetic fields
!
! Robert Schrom 7/31/17
!--------------------------------
program ehsim
    use numerical
    implicit none

    ! grid parameters
    integer, parameter :: numx = 9, numy = 9, numz = 9
    integer :: i, j, k

    ! magnetic field
    double precision, dimension(numx, numy, numz+1) :: hz
    double precision, dimension(numx, numy+1, numz) :: hy
    double precision, dimension(numx+1, numy, numz) :: hx

    ! electric field
    double precision, dimension(numx+1, numy+1, numz) :: ez
    double precision, dimension(numx+1, numy, numz+1) :: ey
    double precision, dimension(numx, numy+1, numz+1) :: ex


end program
