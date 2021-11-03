pablo = Freelancer.create!(email: 'pablo@mail.com', password: '123456')
Profile.create!(full_name: 'Pablo', social_name: '', 
                birth_date: '19950608', educational_background: 'Publicidade na PUC', 
                work_field: 'Midias Sociais', about_me:'Experiente e eficaz', 
                work_experience: 'veja portafolio, https://portafolio.com/ ', 
                freelancer: pablo
                )
pedro = Freelancer.create!(email: 'pedro@mail.com', password: '123456')
Profile.create!(full_name: 'Pedro', social_name: '', 
                birth_date: '19900608', educational_background: 'Desenvolvedor web desde antes de google', 
                work_field: 'Dev', about_me:'Tengo 30 anos de experiencia, trabalhando em mutlipes projetos web', 
                work_experience: 'Desenvovilmento fullstack em projetos da prefeitura ', 
                freelancer: pedro
                )
andrea = Freelancer.create!(email: 'andrea@mail.com', password: '123456')
Profile.create!(full_name: 'Andrea', social_name: '', 
                birth_date: '19940508', educational_background: 'Desenho Grafico', 
                work_field: 'UX Design', about_me:'Sou uma boa comunicadora e sei lidar com equipes diversas', 
                work_experience: 'Trabalhe em grandes empresas com base tecnologica nos ultimos 10 anos', 
                freelancer: andrea
                )
claudia = Freelancer.create!(email: 'claudia@mail.com', password: '123456')
Profile.create!(full_name: 'Roberto Medeiros', social_name: 'Claudia', 
                birth_date: '19970807', educational_background: 'Ingenharia da computação', 
                work_field: 'Segurança', about_me:'Sou introvertida mas muito produtiva', 
                work_experience: 'Experta em sistemas com base em UNIX', 
                freelancer: claudia
                )
Freelancer.create!(email: 'sem_perfil@mail.com', password: '123456')

panaderia = Owner.create!(email: 'panaderia@mail.com', password: '123456')
project_1 = Project.create!(title: 'Site para domicilios de comercio local', 
                            description: 'Um site com fotos dos produtos, localização, 
                                          região de atendimento e whatsapp com mensagem 
                                          para fazer pedido em domicilio',
                            desire_habilities: 'desenvolvimento fullstack para comercios', 
                            max_hour_payment: 40, deadline_for_proposals: Time.now + 5.month, 
                            remote: true, owner: panaderia
                            )  
Proposal.create!(motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia', 
                hourly_rate: 40, hours_per_week: 8, weeks: 10, project: project_1, 
                profile: pablo.profile, status: 'accepted'
                )                                                     
magazine_luiza = Owner.create!(email: 'magazineluizar@mail.com', password: '123456')
project_2 = Project.create!(title: 'Equipe desenvolvedora', 
                            description: 'Sistema de logistica interna para market-place',
                            desire_habilities: 'qualquer professional que tenha propostas interessantes', 
                            max_hour_payment: 100, deadline_for_proposals: Time.now + 5.month, 
                            remote: true, owner: magazine_luiza
                            )
Proposal.create!(motivation: 'Programar é a minha paixão, tenho muitos anos de experiencia e know-how', 
                hourly_rate: 100, hours_per_week: 5, weeks: 8, project: project_2, 
                profile: pedro.profile
                )                            
project_3 = Project.create!(title: 'Gerenciamento de ecommerce', 
                            description: 'gerenciar stocks, fotos e vendas',
                            desire_habilities: 'Back-end dev', 
                            max_hour_payment: 100, deadline_for_proposals: Time.now + 5.month, 
                            remote: true, owner: magazine_luiza
                            )
Proposal.create!(motivation: 'Especialista em ecommerce', 
                hourly_rate: 60, hours_per_week: 10, weeks: 6, project: project_3, 
                profile: andrea.profile
                )                            
Proposal.create!(motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia, trabalhe em varios ecommerce tambem', 
                hourly_rate: 40, hours_per_week: 8, weeks: 10, project: project_3, 
                profile: claudia.profile, status: 'turned_down'
                )                             
roupas = Owner.create!(email: 'vendemosroupa@mail.com', password: '123456')
project_4 = Project.create!(title: 'Marketing em redes sociais', 
                            description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                            desire_habilities: 'Gerenciamento e marketing rede sociais', 
                            max_hour_payment: 60, deadline_for_proposals: Time.now + 2.month, 
                            remote: true, owner: roupas
                            )
cursos = Owner.create!(email: 'cursosdeingles@mail.com', password: '123456')
project_5 = Project.create!(title: 'Marketing em redes sociais', 
                            description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                            desire_habilities: 'Gerenciamento e marketing rede sociais', 
                            max_hour_payment: 80, deadline_for_proposals: Time.now + 7.month, 
                            remote: true, owner: cursos
                            )



                            