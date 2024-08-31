program protoplanetary_disk_temperature
    implicit none

    ! Define variables
    real(8) :: T0, r0, q
    real(8), dimension(:), allocatable :: r, T
    integer :: n, i

    ! Set reference distance (typically 1 AU)
    r0 = 1.0

    ! User input for reference temperature, power-law index, and number of points
    ! print *, 'Enter the reference temperature T0 (e.g., 280 K):'
    read *, T0
    ! print *, 'Enter the power-law index q (typical range 0.5 - 1.0):'
    read *, q
    ! print *, 'Enter the number of distance points (e.g., 10):'
    read *, n

    ! Allocate arrays based on the number of points
    allocate(r(n), T(n))

    ! User input for range of distances
    ! print *, 'Enter the distance range from the star (in AU, e.g., 0.1 to 50):'
    ! print *, 'Enter the minimum distance:'
    read *, r(1)
    ! print *, 'Enter the maximum distance:'
    read *, r(n)

    ! Calculate distance increments
    do i = 2, n
        r(i) = r(1) + (i - 1) * (r(n) - r(1)) / (n - 1)
    end do

    ! Calculate temperature profile
    do i = 1, n
        T(i) = T0 * (r(i) / r0)**(-q)
    end do

    ! Output results in tabular format
    print *, 'Distance (AU)', 'Temperature (K)'
    print *, '-----------------------------'
    do i = 1, n
        print '(F10.2, F15.2)', r(i), T(i)
    end do

    ! Deallocate arrays
    deallocate(r, T)

end program protoplanetary_disk_temperature
