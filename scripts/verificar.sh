#!/usr/bin/env bash
# verificar.sh - Comprueba la actividad de la Semana 9 (solo lectura)
D="$HOME/scripts-s9"
FALLAS=0
res() { if [ "$1" -eq 0 ]; then echo "[OK]    $2"; else echo "[FALTA] $2"; FALLAS=$((FALLAS+1)); fi; }

echo "== Parte 1: Bash =="
[ -x "$D/respaldo.sh" ]; res $? "respaldo.sh existe y es ejecutable"
ls "$HOME"/respaldos/*.tar.gz >/dev/null 2>&1; res $? "hay al menos un respaldo .tar.gz"
ULT=$(ls -t "$HOME"/respaldos/*.tar.gz 2>/dev/null | head -1)
[ -n "$ULT" ] && tar -tzf "$ULT" | grep -q '^documentos/'; res $? "el ultimo respaldo contiene documentos/"
systemctl is-active --quiet cron; res $? "cron esta activo"
crontab -l 2>/dev/null | grep -q 'scripts-s9/respaldo.sh'; res $? "cron tiene la tarea de respaldo"
grep -q 'Respaldo creado' "$HOME/respaldo.log" 2>/dev/null; res $? "el log tiene un respaldo hecho por cron"

echo "== Parte 3: Python e IA =="
[ -f "$D/estado.py" ]; res $? "estado.py existe"
python3 -c "import ast,sys; ast.parse(open(sys.argv[1]).read())" "$D/estado.py" 2>/dev/null; res $? "estado.py tiene sintaxis valida"
[ -f "$D/estado.py" ] && ! grep -qE "os\.system|subprocess|eval|exec|sudo|requests|urllib|remove|unlink|rmtree|rm " "$D/estado.py"; res $? "estado.py sin patrones peligrosos"
[ -s "$D/reporte.txt" ]; res $? "reporte.txt existe y no esta vacio"
[ -s "$D/bitacora_ia.md" ]; res $? "bitacora_ia.md existe"

echo
echo "Pendientes: $FALLAS"
