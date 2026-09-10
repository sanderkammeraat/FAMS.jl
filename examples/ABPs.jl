
using FAMS

using GLMakie

function simulation()

    pair_forces = (Forces.repulsive_soft_disk(1,2.),)

    local_dofevolvers = (DOFevolvers.overdamped_xvf(1),DOFevolvers.overdamped_pqT(1))
    global_dofevolvers = ()
    field_dofevolvers = ()

    N=100_000
    ϕ = 1.2
    poly=15e-2
    Rs =rand(Uniform(1-poly, 1+poly),N)
    display(size(Rs))

    L =  sqrt(pi *sum(Rs.^2) / ϕ)

    initial_state = ParticleState([ Particles.Polar(id=i,type=1, x=[rand(Uniform(-L/2, L/2)) , rand(Uniform(-L/2,L/2)),0],p=normalize([rand(Normal(0, 1)),rand(Normal(0, 1)),0])) for i=1:N ])


    display(L)
    sizes = (L,L,2.);
    print(sizes)
    initial_field_state=()
    field_forces = ()
    field_updaters = ()

    external_forces = (Forces.self_propulsion(1,0.2),Forces.planar_rotational_noise(ontypes=1,Dr=.001))

    system = System(sizes, initial_state,initial_field_state, external_forces, pair_forces,field_forces, field_updaters, local_dofevolvers,global_dofevolvers, field_dofevolvers, true,2.5*(1+poly));

    #Run integration
    #Use plot_disks! for nice visualss
    #Use plot_points! for fast plotting
    sim = Euler_integrator(system,0.01, 1e4,Tplot=nothing,fps=60,plot_functions=(LPlot.disks_v_orientation!,LPlot.directors!),plotdim=2); 
    return sim;

end


sim = simulation()  
