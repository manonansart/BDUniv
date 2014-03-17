// On indique que la date n'est pas valide initialement
int dateValide = 0;
do {
	printf("Jour (JJ) :\n");
	scanf("%s", jourChaine);
	printf("Mois (MM) :\n");
	scanf("%s", moisChaine);
	printf("Année (AAAA) :\n");
	scanf("%s", anneeChaine);

	// Conversion en entiers pour vérifier la date
	int jour, mois, annee;
	jour = atoi(jourChaine);
	mois = atoi(moisChaine);
	annee = atoi(anneeChaine);

	// Les différents jours max dans les mois
	int joursDansLesMois[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

	// Année bissextile ?
	if (annee % 400 == 0 || (annee % 100 != 0 && annee % 4 == 0))
		joursDansLesMois[1] = 29;

	// Le jour correspond bien au mois ?
	if (mois <= 12) {
		if (jour <= joursDansLesMois[mois-1])
		dateValide = 1;
	}

	if (dateValide == 0)
		printf("Merci d'entrer une date valide.\n");
} while(dateValide == 0);

// Si l'utilisateur a rentré une date sur 1 seul caractère on est gentil avec lui
if (strlen(moisChaine) == 1) {
	moisChaine[1] = moisChaine[0];
	moisChaine[0] = '0';
}

// Si l'utilisateur a rentré une date sur 1 seul caractère on est gentil avec lui
if (strlen(jourChaine) == 1) {
	jourChaine[1] = jourChaine[0];
	jourChaine[0] = '0';
}

// Passage au format AAAA-MM-DD pour PostgreSQL
strcpy(dateChaine, anneeChaine);
strcat(dateChaine, "-");
strcat(dateChaine, moisChaine);
strcat(dateChaine, "-");
strcat(dateChaine, jourChaine);

dateSQL = PGTYPESdate_from_asc(dateChaine, NULL);