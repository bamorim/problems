defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  # Probably List comprehension would be better, but I tought that would be cheating too.

  @spec count(list) :: non_neg_integer
  def count(l) do
    case l do
      [] -> 0
      [_|t] -> count(t)+1
    end
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reverse(l,[])
  end

  defp reverse(l,acc) do
    case {l,acc} do
      {[],_} -> acc
      {[h|t], acc} -> reverse(t,[h|acc])
    end
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    case l do
      [] -> []
      [h|t] -> [f.(h)|map(t,f)]
    end
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    case l do
      [] -> []
      [h|t] -> if f.(h) do
        [h|filter(t,f)]
      else
        filter(t,f)
      end
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    case l do
      [] -> acc
      [h|t] -> reduce(t,f.(h,acc),f)
    end
  end

  @spec append(list, list) :: list
  def append(a, b) do
    case {a,b} do
      {[],_} -> b
      {_,[]} -> a
      {[h|t],_} -> [h|append(t,b)]
    end
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    case ll do
      [] -> []
      [h|t] -> append(h,concat(t))
    end
  end
end
