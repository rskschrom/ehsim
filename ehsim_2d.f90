!--------------------------------
! Main program to simulate
! electric and magnetic fields
!
! Robert Schrom 7/31/17
!--------------------------------
program ehsim_1d
    implicit none

    ! grid parameters
    integer, parameter :: numx = 280, numy = 280, numt = 1800
    integer :: i, j, ti
    double precision, parameter :: c = 2.99d8, pi = 3.14159265d0
    double precision, parameter :: ds = 25.d-6, wavl = 2.d-3, e0 = 1.d0
    double precision :: dt, omega, tau
    double precision, dimension(numx, numy) :: er, ei

    ! magnetic and electric fields
    double precision, dimension(numx, numy) :: hy, hx
    double precision, dimension(numx, numy) :: ez

    ! calculate simulation constants
    dt = 0.1d0*ds*sqrt(3.d0)/c
    omega = 2.d0*pi*c/(wavl)

    ! initialize fields, optical properties, and plane wave source
    ez = 0.d0
    hy = 0.d0
    hx = 0.d0

    ! ice cube
    er = 1.d0
    ei = 0.d0
    er(130:150,130:150) = 3.2d0
    ei(130:150,130:150) = 0.d0

    ! time loop
    do ti = 1, numt

        print *, ti
        ! add wave source        
        !ez(1,:) = ez(1,:)+e0*sin(ti*dt*omega)
        ez(1,:) = e0*sin(ti*dt*omega)

        ! solve for hy
        do i = 1, numx-1
            do j = 2, numy
                hy(i,j) = hy(i,j)+c*dt/ds*(ez(i+1,j)-ez(i,j))
            enddo
        enddo

        ! solve for hx
        do i = 2, numx
            do j = 1, numy-1
                hx(i,j) = hx(i,j)+c*dt/ds*(ez(i,j)-ez(i,j+1))
            enddo
        enddo

        ! solve for ez
        do i = 2, numx
            do j = 2, numy
                tau = omega*ei(i,j)/er(i,j)
                ez(i,j) = ez(i,j)*exp(-tau*dt)+c*dt*exp(-tau*dt/2.d0)/(er(i,j)*ds)*&
                          (hy(i,j)-hy(i-1,j)+hx(i,j-1)-hx(i,j))
            enddo
        enddo

        ! add wave source        
        !ez(10,:) = ez(10,:)+e0*sin(ti*dt*omega)
        !ez(10,:) = e0*sin(ti*dt*omega)

        ! apply bcs
        ez(1,:) = ez(2,:)
        ez(:,1) = ez(:,1)
        
        hy(numx,:) = hy(numx-1,:)
        hy(:,1) = hy(:,2)

        hx(1,:) = hx(2,:)
        hx(:,numy) = hx(:,numy-1)
    enddo

    ! output as text file
    open(unit=2, file="out.txt")

    do i = 1, numx
        do j = 1, numy
            write(2,*) hx(i,j), hy(i,j), ez(i,j)
        enddo
    enddo

    close(2)
end program
