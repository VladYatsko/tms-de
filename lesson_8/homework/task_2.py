import sys


def is_anagram(word_one: str, word_two: str) -> bool:
    """
    Current function that checks if two words are anagrams
    :param word_one: First word
    :param word_two: Second word
    :return: Bool value indicating if two words are anagrams.
    """
    return sorted(word_one.lower()) == sorted(word_two.lower())


print(is_anagram(sys.argv[1], sys.argv[2]))
