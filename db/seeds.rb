# todo: manufacturer
m_pe  = Manufacturer.create(name: 'Planet Eclipse')
m_bob = Manufacturer.create(name: 'Bob Long')
m_dye = Manufacturer.create(name: 'Dye')
m_dlx = Manufacturer.create(name: 'Dlx')

# todo: gear
Gear.create(category: 'Marker', name: 'Gsl', manufacturer: m_pe, year: 2013)
Gear.create(category: 'Marker', name: 'Cs1', manufacturer: m_pe, year: 2015)
Gear.create(category: 'Marker', name: 'Csr', manufacturer: m_pe, year: 2016)
Gear.create(category: 'Marker', name: 'G6r', manufacturer: m_bob, year: 2013)
Gear.create(category: 'Marker', name: 'Reptile', manufacturer: m_bob, year: 2015)
Gear.create(category: 'Marker', name: 'Onslaught', manufacturer: m_bob, year: 2014)
Gear.create(category: 'Marker', name: 'm14', manufacturer: m_dye, year: 2014)
Gear.create(category: 'Marker', name: 'm15', manufacturer: m_dye, year: 2015)
Gear.create(category: 'Marker', name: 'm2', manufacturer: m_dye, year: 2016)
Gear.create(category: 'Marker', name: '2.0', manufacturer: m_dlx, year: 2014)
Gear.create(category: 'Marker', name: 'Jocker', manufacturer: m_dlx, year: 2015)
Gear.create(category: 'Marker', name: 'Ice', manufacturer: m_dlx, year: 2016)
