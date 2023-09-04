using LinearAlgebra

# Функция для сверточного перемежения
function FCI(inArr, core)
    shift = [-1, -2, -3]  # Сдвиговые регистры для хранения предыдущих значений входного массива
    outArr = zeros(Int, length(inArr))  # Выходной массив для сохранения результатов свертки
    
    for i in 1:length(inArr)
        if i <= 2
            m_vec = [shift[3], shift[2], shift[1]]
        else
            m_vec = inArr[i-2:i]  # Выбираем подмассив размером 3 из входного массива
        end
        
        outArr[i] = dot(m_vec, core)  # Выполняем свертку подмассива с ядром свертки
        
        shift[1] = shift[2]  # Обновляем значения сдвиговых регистров
        shift[2] = shift[3]
        shift[3] = inArr[i]
    end
    
    return outArr
end

# Функция для сверточного деперемежения
function FDCI(inArr, core)
    shift = [-1, -2, -3]  # Сдвиговые регистры для хранения предыдущих значений выходного массива
    outArr = zeros(Int, length(inArr))  # Выходной массив для сохранения результатов деперемежения
    
    for i in 1:length(inArr)
        if i <= 2
            m_vec = [shift[3], shift[2], shift[1]]
        else
            m_vec = outArr[i-2:i]  # Выбираем подмассив размером 3 из выходного массива
        end
        
        outArr[i] = dot(m_vec, core)  # Выполняем свертку подмассива с ядром свертки
        
        shift[1] = shift[2]  # Обновляем значения сдвиговых регистров
        shift[2] = shift[3]
        shift[3] = outArr[i]
    end
    
    return outArr
end

inArr = collect(0:20)  # Входной массив чисел от 0 до 20
core = [1, 0, 0]  # Пример ядра свертки

# Перемежение входного массива
interleaved_array = FCI(inArr, core)

# Деперемежение массива
deinterleaved_array = FDCI(interleaved_array, core)

# Вывод результатов
println("Входящий ряд чисел: ", inArr)
println("Результат перемежения: ", interleaved_array)
println("Результат деперемежения: ", deinterleaved_array)

#ИЛИ ТАК#

using LinearAlgebra

# Функция для сверточного перемежения
function FCI(inArr, core)
    shift = [-1, -2, -3]  # Сдвиговые регистры для хранения предыдущих значений входного массива
    outArr = zeros(Int, length(inArr))  # Выходной массив для сохранения результатов свертки
    
    for i in 1:length(inArr)
        if i <= 2
            m_vec = [shift[3], shift[2], shift[1]]
        else
            m_vec = inArr[i-2:i]  # Выбираем подмассив размером 3 из входного массива
        end
        
        outArr[i] = dot(m_vec, core)  # Выполняем свертку подмассива с ядром свертки
        
        shift[1] = shift[2]  # Обновляем значения сдвиговых регистров
        shift[2] = shift[3]
        shift[3] = inArr[i]
    end
    
    return outArr
end

# Функция для сверточного деперемежения
function FDCI(inArr, core)
    shift = [-1, -2, -3]  # Сдвиговые регистры для хранения предыдущих значений выходного массива
    outArr = zeros(Int, length(inArr))  # Выходной массив для сохранения результатов деперемежения
    
    for i in 1:length(inArr)
        if i <= 2
            m_vec = [shift[3], shift[2], shift[1]]
        else
            m_vec = inArr[i-2:i]  # Выбираем подмассив размером 3 из входного массива
        end
        
        outArr[i] = dot(m_vec, core)  # Выполняем свертку подмассива с ядром свертки
        
        shift[1] = shift[2]  # Обновляем значения сдвиговых регистров
        shift[2] = shift[3]
        shift[3] = outArr[i]
    end
    
    return outArr
end

inArr = collect(0:20)  # Входной массив чисел от 0 до 20
core = [1, 0, 0]  # Пример ядра свертки

# Перемежение входного массива
interleaved_array = FCI(inArr, core)

# Сохранение исходного массива
original_array = copy(interleaved_array)

# Деперемежение массива
deinterleaved_array = FDCI(original_array, core)

# Вывод результатов
println("Входящий ряд чисел: ", inArr)
println("Результат перемежения: ", interleaved_array)
println("Результат деперемежения: ", deinterleaved_array)