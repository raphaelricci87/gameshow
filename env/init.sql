CREATE TABLE IF NOT EXISTS questions (
    id SERIAL PRIMARY KEY,
    question TEXT NOT NULL,
    option_a TEXT NOT NULL,
    option_b TEXT NOT NULL,
    option_c TEXT NOT NULL,
    option_d TEXT NOT NULL,
    correct_option CHAR(1) NOT NULL
);

CREATE TABLE IF NOT EXISTS images (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    image_path TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS frame_groups (
    id SERIAL PRIMARY KEY,
    group_name TEXT NOT NULL,
    frame_order INTEGER NOT NULL,
    image_path TEXT NOT NULL
);

INSERT INTO images (name, image_path) VALUES
('adonis', '/images/adonis.jpeg'),
('Ainz', '/images/Ainz.jpg'),
('asuna', '/images/asuna.jpg'),
('hajime', '/images/hajime.png'),
('mushoku_tensei', '/images/mushoku_tensei.jpg'),
('Rimuru_Tempest', '/images/Rimuru_Tempest.jpg'),
('tanya', '/images/tanya.jpg'),
('tate_no_yuusha', '/images/tate_no_yuusha.jpg');

INSERT INTO questions (question, option_a, option_b, option_c, option_d, correct_option) VALUES
('Qual estúdio foi responsável pela criação do anime "Neon Genesis Evangelion"?', 'Studio Ghibli', 'Madhouse', 'Gainax', 'Toei Animation', 'C'),
('Em "Attack on Titan", qual é o nome da forma Titã de Eren Yeager?', 'Titã Colossal', 'Titã Blindado', 'Titã Bestial', 'Titã de Ataque', 'D'),
('Em "Death Note", qual é o nome real do personagem L?', 'Lawrence Price', 'L Lawliet', 'Luca Brasi', 'Leo McArthur', 'B'),
('Quem dirigiu o aclamado filme "A Viagem de Chihiro"?', 'Isao Takahata', 'Satoshi Kon', 'Makoto Shinkai', 'Hayao Miyazaki', 'D'),
('Em "Fullmetal Alchemist: Brotherhood", qual é o nome verdadeiro de "Pai", o líder dos Homúnculos?', 'Hohenheim', 'Edward', 'Dante', 'Van Hohenheim', 'A'),
('Qual personagem de "Naruto" se torna o Quinto Hokage?', 'Jiraiya', 'Orochimaru', 'Tsunade', 'Kakashi', 'C'),
('Qual é o nome do demônio que possui Ryuko em "Kill la Kill"?', 'Senketsu', 'Junketsu', 'Kamui', 'Kisaragi', 'A'),
('Qual é o nome verdadeiro de "Spike Spiegel", protagonista de "Cowboy Bebop"?', 'Shinichi', 'Shinji', 'Fearless', 'Kei', 'C'),
('Qual anime apresenta uma batalha épica entre Kenshin Himura e Makoto Shishio?', 'One Piece', 'Naruto', 'Samurai X', 'Bleach', 'C'),
('Quem é o criador do mangá "Berserk"?', 'Yoshihiro Togashi', 'Kentaro Miura', 'Hajime Isayama', 'Eiichiro Oda', 'B'),
('Em "My Hero Academia", qual é o nome do super-herói que All Might passa seu poder?', 'Izuku Midoriya', 'Katsuki Bakugo', 'Shoto Todoroki', 'Eijiro Kirishima', 'A'),
('Qual é o verdadeiro nome de "Kira", o antagonista de "Death Note"?', 'Light Yagami', 'L Lawliet', 'Misa Amane', 'Ryuk', 'A'),
('Quem dirigiu o filme "Akira", um marco na animação japonesa?', 'Mamoru Oshii', 'Hayao Miyazaki', 'Katsuhiro Otomo', 'Satoshi Kon', 'C'),
('Em "One Piece", qual é a recompensa pela cabeça de Monkey D. Luffy após derrotar Doflamingo?', '300 milhões de berries', '500 milhões de berries', '1 bilhão de berries', '700 milhões de berries', 'B'),
('Em "Dragon Ball Z", qual é a primeira transformação que Goku alcança?', 'Super Saiyajin', 'Kaio-Ken', 'Instinto Superior', 'Super Saiyajin 3', 'A'),
('Quem é o autor de "Hunter x Hunter"?', 'Eiichiro Oda', 'Tite Kubo', 'Yoshihiro Togashi', 'Hajime Isayama', 'C'),
('Qual é o nome do navio da Frota de Estrelas em "Space Battleship Yamato"?', 'Arcadia', 'Andromeda', 'Yamato', 'Sirius', 'C'),
('Em "Akame ga Kill", qual é o nome da espada usada por Akame?', 'Murasame', 'Excalibur', 'Kusanagi', 'Muramasa', 'A'),
('Qual anime é conhecido por ter o episódio chamado "The Man Who Sold the World"?', 'Baccano!', 'Cowboy Bebop', 'Neon Genesis Evangelion', 'Ghost in the Shell', 'B'),
('Qual é o nome do irmão de Inuyasha em "Inuyasha"?', 'Sesshomaru', 'Naraku', 'Miroku', 'Koga', 'A'),
('Qual estúdio é conhecido por produzir "Akira" e "Steamboy"?', 'Madhouse', 'Toei Animation', 'Sunrise', 'TMS Entertainment', 'D'),
('Quem é o diretor do filme "Perfect Blue"?', 'Hayao Miyazaki', 'Mamoru Hosoda', 'Satoshi Kon', 'Katsuhiro Otomo', 'C'),
('Qual estúdio criou o anime "Cowboy Bebop"?', 'Bones', 'Sunrise', 'Gainax', 'MAPPA', 'B'),
('Quem dirigiu o anime "Your Name"?', 'Isao Takahata', 'Mamoru Hosoda', 'Makoto Shinkai', 'Hideaki Anno', 'C'),
('Qual estúdio foi responsável pela produção de "Sword Art Online"?', 'A-1 Pictures', 'Madhouse', 'Bones', 'Wit Studio', 'A'),
('Quem é o diretor por trás do aclamado anime "Evangelion"?', 'Yoshiaki Kawajiri', 'Hideaki Anno', 'Shinichiro Watanabe', 'Satoshi Kon', 'B'),
('Qual estúdio é famoso por seus filmes "Meu Amigo Totoro" e "Princesa Mononoke"?', 'Sunrise', 'Ghibli', 'Bones', 'Trigger', 'B'),
('Quem dirigiu o filme "A Garota que Conquistou o Tempo"?', 'Makoto Shinkai', 'Mamoru Hosoda', 'Hayao Miyazaki', 'Satoshi Kon', 'B'),
('Qual estúdio produziu "One Punch Man"?', 'Madhouse', 'Trigger', 'Sunrise', 'Bones', 'A'),
('Quem dirigiu o filme "O Conto da Princesa Kaguya"?', 'Isao Takahata', 'Hayao Miyazaki', 'Mamoru Oshii', 'Makoto Shinkai', 'A'),
('Qual estúdio é responsável pela série "Attack on Titan"?', 'A-1 Pictures', 'Wit Studio', 'MAPPA', 'Madhouse', 'B'),
('Quem dirigiu "Akira", um dos filmes de anime mais influentes de todos os tempos?', 'Katsuhiro Otomo', 'Mamoru Hosoda', 'Satoshi Kon', 'Hideaki Anno', 'A'),
('Qual estúdio criou o anime "Mob Psycho 100"?', 'MAPPA', 'Bones', 'Sunrise', 'Studio Pierrot', 'B'),
('Quem é o diretor do filme "Paprika", que inspirou "A Origem"?', 'Mamoru Oshii', 'Makoto Shinkai', 'Hayao Miyazaki', 'Satoshi Kon', 'D'),
('Qual estúdio é responsável por "My Hero Academia"?', 'Bones', 'Madhouse', 'A-1 Pictures', 'Wit Studio', 'A'),
('Quem dirigiu a série "Samurai Champloo"?', 'Satoshi Kon', 'Shinichiro Watanabe', 'Hayao Miyazaki', 'Katsuhiro Otomo', 'B'),
('Qual estúdio foi responsável pela produção de "Neon Genesis Evangelion"?', 'Gainax', 'Toei Animation', 'Bones', 'Madhouse', 'A'),
('Quem é o diretor do aclamado filme "Ghost in the Shell"?', 'Mamoru Oshii', 'Makoto Shinkai', 'Hideaki Anno', 'Isao Takahata', 'A'),
('Qual estúdio produziu "Kill la Kill"?', 'Trigger', 'Madhouse', 'Sunrise', 'Bones', 'A'),
('Quem dirigiu "5 Centimeters Per Second", um drama romântico de anime?', 'Makoto Shinkai', 'Hayao Miyazaki', 'Mamoru Hosoda', 'Isao Takahata', 'A'),
('Qual estúdio foi formado por ex-funcionários da Gainax e produziu o anime "Gurren Lagann"?', 'Trigger', 'Bones', 'Sunrise', 'Madhouse', 'A'),
('Quem foi o diretor original da série "Mobile Suit Gundam" e é considerado o "pai" dos animes mecha realistas?', 'Mamoru Oshii', 'Hideaki Anno', 'Yoshiyuki Tomino', 'Hajime Yatate', 'C'),
('Qual estúdio é conhecido por ter uma parceria constante com o diretor Satoshi Kon, incluindo "Perfect Blue" e "Paprika"?', 'Studio 4°C', 'Madhouse', 'Bones', 'Production I.G', 'B'),
('Quem dirigiu o anime experimental "The End of Evangelion", conhecido por seu estilo controverso?', 'Yoshiyuki Tomino', 'Kunihiko Ikuhara', 'Hideaki Anno', 'Takeshi Koike', 'C'),
('Qual estúdio produziu "Paranoia Agent", a única série de TV dirigida por Satoshi Kon?', 'Sunrise', 'Madhouse', 'Trigger', 'Ghibli', 'B'),
('Quem dirigiu o filme de anime "Redline", conhecido por sua produção que levou sete anos?', 'Katsuhiro Otomo', 'Mamoru Hosoda', 'Takeshi Koike', 'Makoto Shinkai', 'C'),
('Qual estúdio é conhecido por produzir animes de alta qualidade visual como "Fate/Zero" e "Demon Slayer"?', 'Wit Studio', 'Ufotable', 'MAPPA', 'Bones', 'B'),
('Quem foi o diretor de "Mind Game", um filme de anime experimental e psicodélico?', 'Satoshi Kon', 'Masaaki Yuasa', 'Mamoru Oshii', 'Shinichiro Watanabe', 'B'),
('Qual estúdio foi fundado por ex-funcionários do Sunrise e produziu "Code Geass"?', 'Sunrise', 'Trigger', 'Bones', 'Sunrise e Studio 8', 'D'),
('Quem dirigiu "Angels Egg", um dos filmes de anime mais enigmáticos e simbólicos da história?', 'Mamoru Oshii', 'Isao Takahata', 'Hayao Miyazaki', 'Makoto Shinkai', 'A'),
('Qual estúdio de animação é responsável pela franquia "Ghost in the Shell: Stand Alone Complex"?', 'Production I.G', 'Sunrise', 'Bones', 'Madhouse', 'A'),
('Quem dirigiu "Serial Experiments Lain", um anime que explora temas de identidade e tecnologia?', 'Ryutaro Nakamura', 'Satoshi Kon', 'Kunihiko Ikuhara', 'Hideaki Anno', 'A'),
('Qual estúdio produziu "Revolutionary Girl Utena", um anime conhecido por seus temas surrealistas e simbolismo?', 'Gainax', 'J.C. Staff', 'TMS Entertainment', 'Bee Train', 'B'),
('Quem foi o diretor do anime "FLCL", uma colaboração entre Gainax, Production I.G, e King Records?', 'Hideaki Anno', 'Kazuya Tsurumaki', 'Yoshiyuki Tomino', 'Shinji Higuchi', 'B'),
('Qual estúdio produziu "Mononoke", uma série spin-off de "Ayakashi: Samurai Horror Tales"?', 'Toei Animation', 'Bee Train', 'Madhouse', 'Toei Animation e Fuji TV', 'D'),
('Quem foi o diretor de "Kemonozume", um anime que combina estilos de animação experimentais e narrativas não convencionais?', 'Masaaki Yuasa', 'Mamoru Hosoda', 'Satoshi Kon', 'Takeshi Koike', 'A'),
('Qual estúdio produziu "Ergo Proxy", um anime conhecido por sua estética cyberpunk e filosofia profunda?', 'Manglobe', 'Madhouse', 'Production I.G', 'Trigger', 'A'),
('Quem dirigiu "The Tatami Galaxy", um anime que utiliza narrativas rápidas e complexas?', 'Makoto Shinkai', 'Masaaki Yuasa', 'Kunihiko Ikuhara', 'Shinichiro Watanabe', 'B'),
('Qual estúdio é responsável pela produção do anime "Ping Pong The Animation"?', 'Ufotable', 'Bones', 'TMS Entertainment', 'Tatsunoko Production', 'D'),
('Quem foi o diretor do anime "Rebuild of Evangelion", a série de filmes que revisita e reinterpreta "Neon Genesis Evangelion"?', 'Yoshiyuki Tomino', 'Kazuya Tsurumaki', 'Hideaki Anno', 'Hiroyuki Imaishi', 'C');


INSERT INTO frame_groups (group_name, frame_order, image_path) VALUES
('Episode 1', 1, '/images/SAO/1.png'),
('Episode 1', 2, '/images/SAO/2.png'),
('Episode 1', 3, '/images/SAO/3.png'),
('Episode 1', 4, '/images/SAO/4.png'),
('Episode 1', 5, '/images/SAO/5.png');

